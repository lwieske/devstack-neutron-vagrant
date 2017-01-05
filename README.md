## OpenStack/Newton VM based on Devstack/Neutron

### Prerequisite: Vagrant

[Vagrant](http://www.vagrantup.org) uses [VirtualBox](http://www.virtualbox.org) to create virtual machines.

### Create OpenStack VM

    git clone http://github.com/lwieske/devstack-neutron-vagrant.git

    cd devstack-neutron-vagrant

    vagrant up

### Probe The Instance

    ping -c 7 172.24.4.12

Please verify the floating ip address to avoid problems.

    ssh cirros@172.24.4.12

    password: cubswin:)

The two special characters at the end are part of it.

### Lookup Dashboard

    open http://10.10.10.10

    username: demo / password: openstack

There you can navigate the security group `ping-secgroup` for ingress traffic
to the launched instance `ping-instance` and its associated floating ip.

```
% vagrant destroy --force
==> default: VM not created. Moving on...
% vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'bento/ubuntu-16.04'...
==> default: Matching MAC address for NAT networking...
==> default: Checking if box 'bento/ubuntu-16.04' is up to date...
==> default: Setting the name of the VM: devstack-neutron-vagrant
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
    default: Adapter 2: hostonly
    default: Adapter 3: hostonly
==> default: Forwarding ports...
    default: 22 (guest) => 2222 (host) (adapter 1)
==> default: Running 'pre-boot' VM customizations...
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: private key
    default:
    default: Vagrant insecure key detected. Vagrant will automatically replace
    default: this with a newly generated keypair for better security.
    default:
    default: Inserting generated public key within guest...
    default: Removing insecure key from the guest if it's present...
    default: Key inserted! Disconnecting and reconnecting using new SSH key...
==> default: Machine booted and ready!
==> default: Checking for guest additions in VM...
==> default: Setting hostname...
==> default: Configuring and enabling network interfaces...
==> default: Mounting shared folders...
    default: /vagrant => /Users/lothar/GitHub/devstack-neutron-vagrant
==> default: Running provisioner: shell...
    default: Running: inline script
==> default: mesg: ttyname failed: Inappropriate ioctl for device
==> default: Ignore the previous error, fixing this now...
==> default: Running provisioner: shell...
    default: Running: inline script
==> default: ++ timedatectl set-timezone Europe/Berlin
==> default: ++ dpkg-reconfigure -f noninteractive tzdata
==> default: Current default time zone: 'Europe/Berlin'
==> default: Local time is now:      Thu Jan  5 10:31:10 CET 2017.
==> default: Universal Time is now:  Thu Jan  5 09:31:10 UTC 2017.
==> default: ++ apt-get update
==> default: ++ apt-get -y install git-core
==> default: ++ ip link set dev enp0s9 up
==> default: ++ su vagrant -c 'git clone git://github.com/openstack-dev/devstack.git -b stable/newton &> /dev/null'
==> default: ++ su vagrant -c 'cp /vagrant/local.conf devstack'
==> default: ++ su vagrant -c 'devstack/stack.sh                                                      2> /dev/null'
==> default: 2017-01-05 09:31:33.233 | stack.sh log /opt/stack/logs/stack.sh.log.2017-01-05-103133
==> default: 2017-01-05 09:31:38.923 | Installing package prerequisites
==> default: 2017-01-05 09:37:22.722 | Installing OpenStack project source
==> default: 2017-01-05 09:58:11.135 | Starting RabbitMQ
==> default: 2017-01-05 09:58:12.568 | Configuring and starting MySQL
==> default: 2017-01-05 09:58:19.414 | Starting Keystone
==> default: 2017-01-05 10:02:19.045 | Configuring Horizon
==> default: 2017-01-05 10:04:48.299 | Configuring Glance
==> default: 2017-01-05 10:04:56.211 | Configuring Neutron
==> default: 2017-01-05 10:05:31.318 | Configuring Cinder
==> default: 2017-01-05 10:05:36.431 | Configuring Nova
==> default: 2017-01-05 10:05:56.742 | Starting Glance
==> default: 2017-01-05 10:06:06.432 | Uploading images
==> default: 2017-01-05 10:06:36.900 | Starting Nova API
==> default: 2017-01-05 10:06:45.466 | Starting Neutron
==> default: 2017-01-05 10:07:45.875 | Starting Nova
==> default: 2017-01-05 10:08:28.737 | Starting Cinder
==> default: 2017-01-05 10:08:46.487 | Starting Horizon
==> default: 2017-01-05 10:09:59.275 | Configuring lvm.conf global device filter
==> default: 2017-01-05 10:09:59.622 | set lvm.conf device global_filter to: global_filter = [ "a|loop0|", "a|loop1|", "a|sda5|", "r|.*|" ] # from devstack
==> default:
==> default: =========================
==> default: DevStack Component Timing
==> default: =========================
==> default: Total runtime         2307
==> default:
==> default: run_process            53
==> default: test_with_retry         4
==> default: apt-get-update          2
==> default: pip_install           522
==> default: restart_apache_server  11
==> default: wait_for_service       16
==> default: git_timed             845
==> default: apt-get               338
==> default: =========================
==> default:
==> default:
==> default:
==> default: This is your host IP address: 10.10.10.10
==> default: This is your host IPv6 address: fe80::a00:27ff:fefc:acb
==> default: Horizon is now available at http://10.10.10.10/dashboard
==> default: Keystone is serving at http://10.10.10.10/identity/
==> default: The default users are: admin and demo
==> default: The password: openstack
==> default: 2017-01-05 10:09:59.704 | WARNING:
==> default: 2017-01-05 10:09:59.704 | Using lib/neutron-legacy is deprecated, and it will be removed in the future
==> default: 2017-01-05 10:09:59.704 | stack.sh completed in 2307 seconds.
==> default: ++ ovs-vsctl add-port br-ex enp0s9
==> default: ++ echo 1
==> default: ++ iptables -t nat -A POSTROUTING -o enp0s8 -j MASQUERADE
==> default: ++ su vagrant -c 'bash -x /vagrant/launch-instance.sh'
==> default: + export OS_TENANT_NAME=demo
==> default: + OS_TENANT_NAME=demo
==> default: + export OS_USERNAME=demo
==> default: + OS_USERNAME=demo
==> default: + export OS_PASSWORD=openstack
==> default: + OS_PASSWORD=openstack
==> default: + export OS_AUTH_URL=http://10.10.10.10:5000/v2.0/
==> default: + OS_AUTH_URL=http://10.10.10.10:5000/v2.0/
==> default: + PING_FLAVOR=m1.tiny
==> default: + PING_IMAGE=cirros-0.3.4-x86_64-uec
==> default: + PING_INSTANCE=ping-instance
==> default: + PING_SECGROUP=ping-secgroup
==> default: + openstack security group create ping-secgroup --description ping-secgroup
==> default: +-----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
==> default: | Field           | Value                                                                                                                                                                                                                     |
==> default: +-----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
==> default: | created_at      | 2017-01-05T10:10:12Z                                                                                                                                                                                                      |
==> default: | description     | ping-secgroup                                                                                                                                                                                                             |
==> default: | headers         |                                                                                                                                                                                                                           |
==> default: | id              | 27c22eb6-5404-4cd1-8c0e-d8ac3e845e34                                                                                                                                                                                      |
==> default: | name            | ping-secgroup                                                                                                                                                                                                             |
==> default: | project_id      | ec928a1e083c4533bf011879d4cb2e71                                                                                                                                                                                          |
==> default: | project_id      | ec928a1e083c4533bf011879d4cb2e71                                                                                                                                                                                          |
==> default: | revision_number | 1                                                                                                                                                                                                                         |
==> default: | rules           | created_at='2017-01-05T10:10:12Z', direction='egress', ethertype='IPv4', id='348e9d16-8f31-4c96-81a6-3cae3dc9df7a', project_id='ec928a1e083c4533bf011879d4cb2e71', revision_number='1', updated_at='2017-01-05T10:10:12Z' |
==> default: |                 | created_at='2017-01-05T10:10:12Z', direction='egress', ethertype='IPv6', id='7650f119-69f1-45f1-a990-cf5b3f60dc9e', project_id='ec928a1e083c4533bf011879d4cb2e71', revision_number='1', updated_at='2017-01-05T10:10:12Z' |
==> default: | updated_at      | 2017-01-05T10:10:12Z                                                                                                                                                                                                      |
==> default: +-----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
==> default: + openstack security group rule create ping-secgroup --proto icmp --src-ip 0.0.0.0/0 --dst-port -1
==> default: +-------------------+--------------------------------------+
==> default: | Field             | Value                                |
==> default: +-------------------+--------------------------------------+
==> default: | created_at        | 2017-01-05T10:10:14Z                 |
==> default: | description       |                                      |
==> default: | direction         | ingress                              |
==> default: | ethertype         | IPv4                                 |
==> default: | headers           |                                      |
==> default: | id                | b75ab075-9306-48a4-b7d4-6e6ba49ce329 |
==> default: | port_range_max    | None                                 |
==> default: | port_range_min    | None                                 |
==> default: | project_id        | ec928a1e083c4533bf011879d4cb2e71     |
==> default: | project_id        | ec928a1e083c4533bf011879d4cb2e71     |
==> default: | protocol          | icmp                                 |
==> default: | remote_group_id   | None                                 |
==> default: | remote_ip_prefix  | 0.0.0.0/0                            |
==> default: | revision_number   | 1                                    |
==> default: | security_group_id | 27c22eb6-5404-4cd1-8c0e-d8ac3e845e34 |
==> default: | updated_at        | 2017-01-05T10:10:14Z                 |
==> default: +-------------------+--------------------------------------+
==> default: + openstack security group rule create ping-secgroup --proto tcp --src-ip 0.0.0.0/0 --dst-port 22
==> default: +-------------------+--------------------------------------+
==> default: | Field             | Value                                |
==> default: +-------------------+--------------------------------------+
==> default: | created_at        | 2017-01-05T10:10:20Z                 |
==> default: | description       |                                      |
==> default: | direction         | ingress                              |
==> default: | ethertype         | IPv4                                 |
==> default: | headers           |                                      |
==> default: | id                | 80393534-142d-4bb1-ab07-3c44d3d379c8 |
==> default: | port_range_max    | 22                                   |
==> default: | port_range_min    | 22                                   |
==> default: | project_id        | ec928a1e083c4533bf011879d4cb2e71     |
==> default: | project_id        | ec928a1e083c4533bf011879d4cb2e71     |
==> default: | protocol          | tcp                                  |
==> default: | remote_group_id   | None                                 |
==> default: | remote_ip_prefix  | 0.0.0.0/0                            |
==> default: | revision_number   | 1                                    |
==> default: | security_group_id | 27c22eb6-5404-4cd1-8c0e-d8ac3e845e34 |
==> default: | updated_at        | 2017-01-05T10:10:20Z                 |
==> default: +-------------------+--------------------------------------+
==> default: + openstack server create --image cirros-0.3.4-x86_64-uec --flavor m1.tiny --security-group ping-secgroup ping-instance
==> default: +--------------------------------------+----------------------------------------------------------------+
==> default: | Field                                | Value                                                          |
==> default: +--------------------------------------+----------------------------------------------------------------+
==> default: | OS-DCF:diskConfig                    | MANUAL                                                         |
==> default: | OS-EXT-AZ:availability_zone          |                                                                |
==> default: | OS-EXT-STS:power_state               | NOSTATE                                                        |
==> default: | OS-EXT-STS:task_state                | scheduling                                                     |
==> default: | OS-EXT-STS:vm_state                  | building                                                       |
==> default: | OS-SRV-USG:launched_at               | None                                                           |
==> default: | OS-SRV-USG:terminated_at             | None                                                           |
==> default: | accessIPv4                           |                                                                |
==> default: | accessIPv6                           |                                                                |
==> default: | addresses                            |                                                                |
==> default: | adminPass                            | hzkznhdn8W6p                                                   |
==> default: | config_drive                         |                                                                |
==> default: | created                              | 2017-01-05T10:10:27Z                                           |
==> default: | flavor                               | m1.tiny (1)                                                    |
==> default: | hostId                               |                                                                |
==> default: | id                                   | 285d72b2-e4e8-463a-9a44-fea8751331cb                           |
==> default: | image                                | cirros-0.3.4-x86_64-uec (a7fc8225-01b9-4da2-acd4-e9991ede2d8d) |
==> default: | key_name                             | None                                                           |
==> default: | name                                 | ping-instance                                                  |
==> default: | os-extended-volumes:volumes_attached | []                                                             |
==> default: | progress                             | 0                                                              |
==> default: | project_id                           | ec928a1e083c4533bf011879d4cb2e71                               |
==> default: | properties                           |                                                                |
==> default: | security_groups                      | [{u'name': u'ping-secgroup'}]                                  |
==> default: | status                               | BUILD                                                          |
==> default: | updated                              | 2017-01-05T10:10:27Z                                           |
==> default: | user_id                              | 9fa1dd5b9c064f45887f33be98812592                               |
==> default: +--------------------------------------+----------------------------------------------------------------+
==> default: + openstack floating ip create public
==> default: +---------------------+--------------------------------------+
==> default: | Field               | Value                                |
==> default: +---------------------+--------------------------------------+
==> default: | created_at          | 2017-01-05T10:10:30Z                 |
==> default: | description         |                                      |
==> default: | fixed_ip_address    | None                                 |
==> default: | floating_ip_address | 172.24.4.12                          |
==> default: | floating_network_id | 497ba5c3-371a-41b5-938e-5df2b36cd40c |
==> default: | headers             |                                      |
==> default: | id                  | cf258bea-b8bf-4770-8e0e-be9ac41d8132 |
==> default: | port_id             | None                                 |
==> default: | project_id          | ec928a1e083c4533bf011879d4cb2e71     |
==> default: | project_id          | ec928a1e083c4533bf011879d4cb2e71     |
==> default: | revision_number     | 1                                    |
==> default: | router_id           | None                                 |
==> default: | status              | DOWN                                 |
==> default: | updated_at          | 2017-01-05T10:10:30Z                 |
==> default: +---------------------+--------------------------------------+
==> default: ++ sed -n 4,4p
==> default: ++ awk '{print $2;}'
==> default: ++ openstack floating ip list -c 'Floating IP Address'
==> default: + FLOATING_IP=172.24.4.12
==> default: + openstack server add floating ip ping-instance 172.24.4.12
==> default: ++ sleep 30
cloudgate% ping -c 7 172.24.4.12
PING 172.24.4.12 (172.24.4.12): 56 data bytes
64 bytes from 172.24.4.12: icmp_seq=0 ttl=63 time=2.028 ms
64 bytes from 172.24.4.12: icmp_seq=1 ttl=63 time=0.862 ms
64 bytes from 172.24.4.12: icmp_seq=2 ttl=63 time=0.830 ms
64 bytes from 172.24.4.12: icmp_seq=3 ttl=63 time=1.055 ms
64 bytes from 172.24.4.12: icmp_seq=4 ttl=63 time=0.718 ms
64 bytes from 172.24.4.12: icmp_seq=5 ttl=63 time=0.869 ms
^C
--- 172.24.4.12 ping statistics ---
6 packets transmitted, 6 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 0.718/1.060/2.028/0.444 ms
cloudgate% ssh cirros@172.24.4.12
The authenticity of host '172.24.4.12 (172.24.4.12)' can't be established.
RSA key fingerprint is SHA256:ZeaIYU3JLO7QjW4BC4M7b8BZxQhWfHiSLacR242f3Og.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '172.24.4.12' (RSA) to the list of known hosts.
cirros@172.24.4.12's password:
$ exit
Connection to 172.24.4.12 closed.
% open http://10.10.10.10
%
```
