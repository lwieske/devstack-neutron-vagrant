#!/bin/bash -x

export OS_AUTH_URL=http://10.10.10.10/identity/v3
export OS_PROJECT_NAME="demo"
export OS_USER_DOMAIN_NAME="Default"
export OS_PROJECT_DOMAIN_ID="default"
export OS_USERNAME=demo
export OS_PASSWORD=openstack
export OS_REGION_NAME="RegionOne"

export OS_INTERFACE=public
export OS_IDENTITY_API_VERSION=3

PING_FLAVOR=m1.tiny
PING_IMAGE=cirros-0.3.5-x86_64-disk
PING_INSTANCE=ping-instance
PING_SECGROUP=ping-secgroup

##########
# SECGROUP
##########

openstack security group create      $PING_SECGROUP --description "ping-secgroup"
openstack security group rule create $PING_SECGROUP --proto icmp --remote-ip 0.0.0.0/0 --dst-port -1
openstack security group rule create $PING_SECGROUP --proto tcp  --remote-ip 0.0.0.0/0 --dst-port 22

########
# LAUNCH
########

openstack server create --image $PING_IMAGE --flavor $PING_FLAVOR --security-group $PING_SECGROUP $PING_INSTANCE

###########
# ASSOCIATE
###########

openstack floating ip create public
FLOATING_IP=`openstack floating ip list -c "Floating IP Address" | sed -n 4,4p | awk '{print $2;}'`
openstack server add floating ip $PING_INSTANCE $FLOATING_IP
