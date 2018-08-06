= OpenShift Container Platform - Advanced Deployment - Homework

**Goals**

I deploy and configure OpenShift Container Platform on a group of servers to meet client requirements:

* Configure Red Hat Enterprise Linux 7 hosts for OpenShift deployment.

* Deploy a highly available OpenShift Container Platform cluster.

* Configure the OpenShift Container Platform cluster.

**Provisioned Environment Hosts**

$GUID=7e7f

* Bastion host: bastion.$GUID.example.opentlc.com, bastion.$GUID.internal

* Load balancer: loadbalancer.$GUID.example.opentlc.com, loadbalancer1.$GUID.internal

* 3 OpenShift master nodes: master{1,2,3}.$GUID.internal

* 2 OpenShift infrastructure nodes: infranode{1,2}.$GUID.example.opentlc.com, infranode{1,2}.$GUID.internal

* 4 OpenShift worker nodes: node{1-4}.$GUID.internal

* NFS server: support1.$GUID.internal

* 3 GlusterFS servers: support{1-3}.$GUID.internal

These servers are initially disabled



