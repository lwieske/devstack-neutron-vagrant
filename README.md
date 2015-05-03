## OpenStack/Kilo VM based on Devstack/Neutron

### Prerequisite: Vagrant

[Vagrant](http://www.vagrantup.org) uses [VirtualBox](http://www.virtualbox.org) to create virtual machines.

### Create OpenStack VM

    git clone http://github.com/lwieske/devstack-neutron-vagrant.git

    cd devstack-neutron-vagrant

    vagrant up

### Probe The Instance

    ping -c 7 172.24.4.3

Please verify the floating ip address to avoid problems.

    ssh cirros@172.24.4.3

    password: cubswin:)

The two special characters at the end are part of it.

### Lookup Dashboard

    open http://10.10.10.10

    username: demo / password: openstack

There you can navigate the security group `ping-secgroup` for ingress traffic
to the launched instance `ping-instance` and its associated floating ip
(probably `127.24.4.3`).
