#!/usr/bin/sh

export GUID=`hostname | cut -d"." -f2`

ansible masters -m shell -a 'htpasswd -b /etc/origin/master/htpasswd amy amy'
ansible masters -m shell -a 'htpasswd -b /etc/origin/master/htpasswd andrew andrew'
ansible masters -m shell -a 'htpasswd -b /etc/origin/master/htpasswd brian brian'
ansible masters -m shell -a 'htpasswd -b /etc/origin/master/htpasswd betty betty'

oc adm groups new alpha amy andrew
oc adm groups new beta brian betty

for OCP_USERNAME in amy andrew brian betty; do

oc create clusterquota clusterquota-$OCP_USERNAME \
 --project-annotation-selector=openshift.io/requester=$OCP_USERNAME \
 --hard pods=25 \
 --hard requests.memory=6Gi \
 --hard requests.cpu=5 \
 --hard limits.cpu=25  \
 --hard limits.memory=40Gi \
 --hard configmaps=25 \
 --hard persistentvolumeclaims=25  \
 --hard services=25

done

pwd=`pwd`
export pwd=$pwd/template/template.yml
echo "Create template from ${pwd}"
oc create -f $pwd

ansible masters -m shell -a "sed -i 's/projectRequestTemplate.*/projectRequestTemplate\: \"default\/project-request\"/g' /etc/origin/master/master-config.yaml"
ansible masters -m shell -a'systemctl restart atomic-openshift-master-api'
ansible masters -m shell -a'systemctl restart atomic-openshift-master-controllers'
