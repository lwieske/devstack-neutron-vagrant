#!/bin/bash -x

export OS_TENANT_NAME=demo

export OS_USERNAME=demo
export OS_PASSWORD=openstack

export OS_AUTH_URL=http://10.10.10.10:5000/v2.0/

PING_FLAVOR=m1.tiny
PING_IMAGE=cirros-0.3.4-x86_64-uec
PING_INSTANCE=ping-instance
PING_SECGROUP=ping-secgroup

##########
# SECGROUP
##########

openstack security group create      $PING_SECGROUP --description "ping-secgroup"
openstack security group rule create $PING_SECGROUP --proto icmp --src-ip 0.0.0.0/0 --dst-port -1
openstack security group rule create $PING_SECGROUP --proto tcp  --src-ip 0.0.0.0/0 --dst-port 22

########
# LAUNCH
########

openstack server create --image $PING_IMAGE --flavor $PING_FLAVOR --security-group $PING_SECGROUP $PING_INSTANCE

###########
# ASSOCIATE
###########

openstack ip floating create public
FLOATING_IP=`openstack ip floating list -c "Floating IP Address" | sed -n 4,4p | awk '{print $2;}'`
openstack ip floating add $FLOATING_IP $PING_INSTANCE
