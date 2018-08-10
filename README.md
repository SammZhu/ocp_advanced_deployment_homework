# OpenShift Container Platform - Advanced Deployment - Homework







## Summary

**Requirements**

- Ability to authenticate at the master console

- Registry has storage attached and working

- Router is configured on each infranode

- PVs of different types are available for users to consume

- Ability to deploy a simple app (`nodejs-mongo-persistent`)

  

**Provisioned Environment Hosts**

This one-click installation script applies to the following host environment.

* Bastion host: bastion.$GUID.example.opentlc.com, bastion.$GUID.internal

* Load balancer: loadbalancer.$GUID.example.opentlc.com, loadbalancer1.$GUID.internal

* 3 OpenShift master nodes: master{1,2,3}.$GUID.internal

* 2 OpenShift infrastructure nodes: infranode{1,2}.$GUID.example.opentlc.com, infranode{1,2}.$GUID.internal

* 4 OpenShift worker nodes: node{1-4}.$GUID.internal

* NFS server: support1.$GUID.internal




## **Installation**

1. First execute the **sudo** command to ensure that you have operational execution authority, and then clone the prepared script from GitHub to the local environment.

```shell
[xxxx@bastion ~]$ sudo -i
[root@bastion ~]# git clone https://github.com/SammZhu/ocp_advanced_deployment_homework.git
```

2. Then go into the working directory and execute the Ansible playbook script to install the environment.

```shell
[root@bastion ~]# cd ocp_advanced_deployment_homework
[root@bastion ~]# ansible-playbook ./homework.yaml
```



## Uninstallation

If you have an error during installation or need to clear the environment, you can perform the following command to uninstall the software.

```shell
[root@bastion ~]# sh ./scripts/uninstall.sh
```

