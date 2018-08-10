# OpenShift Container Platform - Advanced Deployment - Homework







## Summary

**Main function**

Ansible playbook file **homework.yaml** is entry point for the installation configuration, which includes all operational tasks .

1. Prepare GUID environment variable across all hosts 

2. Verify Installation and Configuration of Docker 

3.  Verify NFS Shared Volumes on Hosts

4.  Install packages and config auth 

5. Generate Inventory Hosts File

6. Execute the openshift-ansible prerequisites

7. Execute the openshift-ansible Deployer 

8. Verify OpenShift Cluster 

9. Post installation configuration 

10. Create PVs for Users 

11. Create 25 definitions files for PVs 5G size 

12. Create 25 definitions files for PVs 10G size 

13. Create all PVs from definitions files 

14. Fix NFS Persistent Volume Recycling 

15. Smoke Test 

16. CI/CD workflow 

17. HPA configuration on production deployment of openshift-tasks 

18. Multitenancy

    

**Provisioned Environment Hosts**

This one-click installation script applies to the following host environment.

* Bastion host: bastion.$GUID.example.opentlc.com, bastion.$GUID.internal

* Load balancer: loadbalancer1.$GUID.example.opentlc.com, loadbalancer1.$GUID.internal

* 3 OpenShift master nodes: master{1,2,3}.$GUID.internal

* 2 OpenShift infrastructure nodes: infranode{1,2}.$GUID.example.opentlc.com, infranode{1,2}.$GUID.internal

* 4 OpenShift worker nodes: node{1-4}.$GUID.internal

* NFS server: support1.$GUID.internal



## Engagement journal 

### Basic Requirements

User **user1** can log in as administrator on the master console.  The password is **r3dh4t1!**

Registry console URL is https://registry-console-default.apps.$GUID.example.opentlc.com.

25 PVs with a size of 5 GB and `ReadWriteOnce`  access mode have been created.

25 PVs with a size of 10 GB and `ReadWriteMany` access mode have been created.

Create and destroy the **nodejs-mongo-persistent** application by using smoking test scripts. 

These are related shell scripts below

```shell
./scripts/create_pvs.sh
./scripts/pvs_5Gsize.sh
./scripts/pvs_10Gsize.sh
./scripts/nodejs_mongo_app.sh
```



### HA Requirements

There are three masters working

There are three etcd instances working

There is a load balancer to access the masters called loadbalancer1.$GUID.example.opentlc.com

There is a load balancer/DNS for both infranodes called *.apps.$GUID.example.opentlc.com

There are at two infranodes, labeled env=infra

These are related shell scripts below

```shell
./scripts/generate_inventory.sh
```



### Environment Configuration

NetworkPolicy is configured and working with projects isolated by default

```
os_sdn_network_plugin_name='redhat/openshift-ovs-multitenant'
```

 Aggregated logging is configured and working

Metrics collection is configured and working

Router and Registry Pods run on Infranodes

Metrics and Logging components run on Infranodes

Service Catalog, Template Service Broker, and Ansible Service Broker are all working very well.

This is hosts file

```shell
./hosts
```



### CICD Workflow

Jenkins pod is running with a persistent volume

Jenkins deploys `openshift-tasks` app

Jenkins OpenShift plugin is used to create a CICD workflow

HPA is configured and working on production deployment of `openshift-tasks`

These are related shell scripts and resources below

```shell
./scripts/cicd.sh
./container-pipelines
./openshift-applier
```



### Multitenancy

Alpha Corp group have two users, Amy and Andrew

Beta Corp group have two users, Brian and Betty

Dedicated node for each Client

`admissionControl` plugin sets specific limits per label (client/customer)

The new project template is modified so that it includes a LimitRange

The new user template is used to create a user object with the specific label value

These are related shell scripts and templates below

```shell
./scripts/multitenancy.sh
./template/template.yml
```



## **Installation**

1. First execute the **sudo** command to ensure that you have operational execution authority, and then clone the prepared script from GitHub to the local environment.

```shell
[xxxx@bastion ~]$ sudo -i
[root@bastion ~]# git clone https://github.com/SammZhu/ocp_advanced_deployment_homework.git
```

2. Then go into the working directory and execute the Ansible playbook script to install the environment. The entire installation will take about an hour.

```shell
[root@bastion ~]# cd ocp_advanced_deployment_homework
[root@bastion ~]# ansible-playbook ./homework.yaml
```



## Uninstallation

If you have an error during installation or need to clear the environment, you can perform the following command to uninstall the software.

```shell
[root@bastion ~]# sh ./scripts/uninstall.sh
```

