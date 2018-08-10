#!/usr/bin/env bash

GUID=`hostname|awk -F. '{print $2}'`
oc new-project smoke-test
oc new-app nodejs-mongo-persistent
#watch oc get pod
sleep 60
oc get pod
oc get route
curl -i --head http://nodejs-mongo-persistent-smoke-test.apps.${GUID}.example.opentlc.com
sleep 20
oc delete project smoke-test
