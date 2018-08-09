#!/usr/bin/env bash

GUID=`hostname|awk -F. '{print $2}'`
oc new-project smoke-test
oc new-app nodejs-mongo-persistent
watch oc get pod
sleep 300
oc get route
curl -k -i --head https://nodejs-mongo-persistent-smoke-test.apps.${GUID}.mitzicom.com
sleep 20
oc delete project smoke-test
