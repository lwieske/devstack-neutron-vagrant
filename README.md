## OpenStack/Pike VM based on Devstack/Neutron

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
==> default:
==> default: Current default time zone: 'Europe/Berlin'
==> default: Local time is now:      Wed Mar  1 05:05:46 CET 2017.
==> default: Universal Time is now:  Wed Mar  1 04:05:46 UTC 2017.
==> default: ++ apt-get update
==> default: ++ apt-get -y install git-core
==> default: ++ ip link set dev enp0s9 up
==> default: ++ su vagrant -c 'git clone git://github.com/openstack-dev/devstack.git -b stable/ocata &> /dev/null'
==> default: ++ su vagrant -c 'cp /vagrant/local.conf devstack                                                   '
==> default: ++ su vagrant -c 'devstack/stack.sh                                                     2> /dev/null'
==> default: 2017-03-01 04:06:10.561 | stack.sh log /opt/stack/logs/stack.sh.log.2017-03-01-050610
==> default: 2017-03-01 04:06:15.471 | Installing package prerequisites
==> default: 2017-03-01 04:10:23.982 | Installing OpenStack project source
==> default: 2017-03-01 04:20:59.353 | Starting RabbitMQ
==> default: 2017-03-01 04:21:00.694 | Configuring and starting MySQL
==> default: 2017-03-01 04:21:07.835 | Starting Keystone
==> default: 2017-03-01 04:25:17.715 | Configuring Horizon
==> default: 2017-03-01 04:27:10.958 | Configuring Glance
==> default: 2017-03-01 04:27:17.462 | Configuring Neutron
==> default: 2017-03-01 04:27:51.938 | Configuring Cinder
==> default: 2017-03-01 04:27:56.628 | Configuring Nova
==> default: 2017-03-01 04:28:16.516 | Configuring placement
==> default: 2017-03-01 04:28:43.602 | Starting Glance
==> default: 2017-03-01 04:28:53.110 | Uploading images
==> default: 2017-03-01 04:29:09.996 | Starting Nova API
==> default: 2017-03-01 04:29:18.444 | Starting Neutron
==> default: 2017-03-01 04:29:38.199 | Creating initial neutron network elements
==> default: 2017-03-01 04:30:24.962 | Starting Nova
==> default: 2017-03-01 04:31:06.692 | Starting Placement
==> default: 2017-03-01 04:31:18.577 | Starting Cinder
==> default: 2017-03-01 04:31:48.506 | Starting Horizon
==> default: 2017-03-01 04:33:13.032 | Configuring lvm.conf global device filter
==> default: 2017-03-01 04:33:13.327 | set lvm.conf device global_filter to: global_filter = [ "a|loop0|", "a|loop1|", "a|sda5|", "r|.*|" ] # from devstack
==> default:
==> default: =========================
==> default: DevStack Component Timing
==> default: =========================
==> default: Total runtime         1624
==> default:
==> default: run_process            53
==> default: test_with_retry         4
==> default: apt-get-update          7
==> default: pip_install           454
==> default: restart_apache_server  16
==> default: wait_for_service       18
==> default: git_timed             291
==> default: apt-get               220
==> default: =========================
==> default:
==> default:
==> default:
==> default: This is your host IP address: 10.10.10.10
==> default: This is your host IPv6 address: fe80::a00:27ff:feef:5285
==> default: Horizon is now available at http://10.10.10.10/dashboard
==> default: 2017-03-01 04:33:13.420 | WARNING:
==> default: 2017-03-01 04:33:13.420 | Using lib/neutron-legacy is deprecated, and it will be removed in the future
==> default: 2017-03-01 04:33:13.420 | stack.sh completed in 1624 seconds.
==> default: Keystone is serving at http://10.10.10.10/identity/
==> default: The default users are: admin and demo
==> default: The password: openstack
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
==> default: +-----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
==> default: | Field           | Value                                                                                                                                                                      |
==> default: +-----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
==> default: | created_at      | 2017-03-01T04:33:26Z                                                                                                                                                       |
==> default: | description     | ping-secgroup                                                                                                                                                              |
==> default: | id              | 175a4596-2707-4172-a7d6-b16c1c6a7944                                                                                                                                       |
==> default: | name            | ping-secgroup                                                                                                                                                              |
==> default: | project_id      | db4b2ecb6c2d490bb4239b5834e3a87a                                                                                                                                           |
==> default: | revision_number | 1                                                                                                                                                                          |
==> default: | rules           | created_at='2017-03-01T04:33:26Z', direction='egress', ethertype='IPv4', id='ab187a27-8108-49b9-9e53-8319411df8b0', revision_number='1', updated_at='2017-03-01T04:33:26Z' |
==> default: |                 | created_at='2017-03-01T04:33:26Z', direction='egress', ethertype='IPv6', id='d9dfbf3a-0057-46de-80ab-2bcaff15b2f7', revision_number='1', updated_at='2017-03-01T04:33:26Z' |
==> default: | updated_at      | 2017-03-01T04:33:26Z                                                                                                                                                       |
==> default: +-----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
==> default: + openstack security group rule create ping-secgroup --proto icmp --src-ip 0.0.0.0/0 --dst-port -1
==> default: The --src-ip option is deprecated, please use --remote-ip instead.
==> default: +-------------------+--------------------------------------+
==> default: | Field             | Value                                |
==> default: +-------------------+--------------------------------------+
==> default: | created_at        | 2017-03-01T04:33:28Z                 |
==> default: | description       |                                      |
==> default: | direction         | ingress                              |
==> default: | ether_type        | IPv4                                 |
==> default: | id                | 901d3198-1dde-46bb-921b-103e559d3b55 |
==> default: | name              | None                                 |
==> default: | port_range_max    | None                                 |
==> default: | port_range_min    | None                                 |
==> default: | project_id        | db4b2ecb6c2d490bb4239b5834e3a87a     |
==> default: | protocol          | icmp                                 |
==> default: | remote_group_id   | None                                 |
==> default: | remote_ip_prefix  | 0.0.0.0/0                            |
==> default: | revision_number   | 1                                    |
==> default: | security_group_id | 175a4596-2707-4172-a7d6-b16c1c6a7944 |
==> default: | updated_at        | 2017-03-01T04:33:28Z                 |
==> default: +-------------------+--------------------------------------+
==> default: + openstack security group rule create ping-secgroup --proto tcp --src-ip 0.0.0.0/0 --dst-port 22
==> default: The --src-ip option is deprecated, please use --remote-ip instead.
==> default: +-------------------+--------------------------------------+
==> default: | Field             | Value                                |
==> default: +-------------------+--------------------------------------+
==> default: | created_at        | 2017-03-01T04:33:33Z                 |
==> default: | description       |                                      |
==> default: | direction         | ingress                              |
==> default: | ether_type        | IPv4                                 |
==> default: | id                | df84a284-f365-4765-887c-0fb41507f253 |
==> default: | name              | None                                 |
==> default: | port_range_max    | 22                                   |
==> default: | port_range_min    | 22                                   |
==> default: | project_id        | db4b2ecb6c2d490bb4239b5834e3a87a     |
==> default: | protocol          | tcp                                  |
==> default: | remote_group_id   | None                                 |
==> default: | remote_ip_prefix  | 0.0.0.0/0                            |
==> default: | revision_number   | 1                                    |
==> default: | security_group_id | 175a4596-2707-4172-a7d6-b16c1c6a7944 |
==> default: | updated_at        | 2017-03-01T04:33:33Z                 |
==> default: +-------------------+--------------------------------------+
==> default: + openstack server create --image cirros-0.3.4-x86_64-uec --flavor m1.tiny --security-group ping-secgroup ping-instance
==> default: +-----------------------------+----------------------------------------------------------------+
==> default: | Field                       | Value                                                          |
==> default: +-----------------------------+----------------------------------------------------------------+
==> default: | OS-DCF:diskConfig           | MANUAL                                                         |
==> default: | OS-EXT-AZ:availability_zone |                                                                |
==> default: | OS-EXT-STS:power_state      | NOSTATE                                                        |
==> default: | OS-EXT-STS:task_state       | scheduling                                                     |
==> default: | OS-EXT-STS:vm_state         | building                                                       |
==> default: | OS-SRV-USG:launched_at      | None                                                           |
==> default: | OS-SRV-USG:terminated_at    | None                                                           |
==> default: | accessIPv4                  |                                                                |
==> default: | accessIPv6                  |                                                                |
==> default: | addresses                   |                                                                |
==> default: | adminPass                   | Jh679jJcZyZT                                                   |
==> default: | config_drive                |                                                                |
==> default: | created                     | 2017-03-01T04:33:38Z                                           |
==> default: | flavor                      | m1.tiny (1)                                                    |
==> default: | hostId                      |                                                                |
==> default: | id                          | 9f5ef020-87eb-4937-affe-41ce1bcd4dbf                           |
==> default: | image                       | cirros-0.3.4-x86_64-uec (b9365ee2-fd56-431c-a591-09700e510f40) |
==> default: | key_name                    | None                                                           |
==> default: | name                        | ping-instance                                                  |
==> default: | progress                    | 0                                                              |
==> default: | project_id                  | db4b2ecb6c2d490bb4239b5834e3a87a                               |
==> default: | properties                  |                                                                |
==> default: | security_groups             | name='ping-secgroup'                                           |
==> default: | status                      | BUILD                                                          |
==> default: | updated                     | 2017-03-01T04:33:37Z                                           |
==> default: | user_id                     | 88e1584439df427295dfdc16e8ca75d5                               |
==> default: | volumes_attached            |                                                                |
==> default: +-----------------------------+----------------------------------------------------------------+
==> default: + openstack floating ip create public
==> default: +---------------------+--------------------------------------+
==> default: | Field               | Value                                |
==> default: +---------------------+--------------------------------------+
==> default: | created_at          | 2017-03-01T04:33:41Z                 |
==> default: | description         |                                      |
==> default: | fixed_ip_address    | None                                 |
==> default: | floating_ip_address | 172.24.4.9                           |
==> default: | floating_network_id | 6fc5c9ce-d222-4b9a-a168-9852a05d9aee |
==> default: | id                  | 48653a6c-b8cb-4e86-a8b9-c5289aa423f3 |
==> default: | name                | None                                 |
==> default: | port_id             | None                                 |
==> default: | project_id          | db4b2ecb6c2d490bb4239b5834e3a87a     |
==> default: | revision_number     | 1                                    |
==> default: | router_id           | None                                 |
==> default: | status              | DOWN                                 |
==> default: | updated_at          | 2017-03-01T04:33:41Z                 |
==> default: +---------------------+--------------------------------------+
==> default: ++ openstack floating ip list -c 'Floating IP Address'
==> default: ++ awk '{print $2;}'
==> default: ++ sed -n 4,4p
==> default: + FLOATING_IP=172.24.4.9
==> default: + openstack server add floating ip ping-instance 172.24.4.9
==> default: ++ sleep 30
cloudgate% ping -c 7 172.24.4.9
PING 172.24.4.9 (172.24.4.9): 56 data bytes
64 bytes from 172.24.4.9: icmp_seq=0 ttl=63 time=2.831 ms
64 bytes from 172.24.4.9: icmp_seq=1 ttl=63 time=1.459 ms
64 bytes from 172.24.4.9: icmp_seq=2 ttl=63 time=2.021 ms
64 bytes from 172.24.4.9: icmp_seq=3 ttl=63 time=0.905 ms
64 bytes from 172.24.4.9: icmp_seq=4 ttl=63 time=1.086 ms
^C
--- 172.24.4.9 ping statistics ---
5 packets transmitted, 5 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 0.905/1.660/2.831/0.699 ms
cloudgate% ssh cirros@172.24.4.9
The authenticity of host '172.24.4.9 (172.24.4.9)' can't be established.
RSA key fingerprint is SHA256:o47vrQFULi2TC6J3Zr65mdugMVznRZEHW/+czXH2Io4.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '172.24.4.9' (RSA) to the list of known hosts.
cirros@172.24.4.9's password:
$ ps -ef
PID   USER     COMMAND
    1 root     init
    2 root     [kthreadd]
    3 root     [ksoftirqd/0]
    4 root     [kworker/0:0]
    5 root     [kworker/u:0]
    6 root     [migration/0]
    7 root     [watchdog/0]
    8 root     [cpuset]
    9 root     [khelper]
   10 root     [kdevtmpfs]
   11 root     [netns]
   12 root     [sync_supers]
   13 root     [bdi-default]
   14 root     [kintegrityd]
   15 root     [kblockd]
   16 root     [ata_sff]
   17 root     [khubd]
   18 root     [md]
   19 root     [kworker/0:1]
   20 root     [kworker/u:1]
   21 root     [khungtaskd]
   22 root     [kswapd0]
   23 root     [ksmd]
   24 root     [fsnotify_mark]
   25 root     [ecryptfs-kthrea]
   26 root     [crypto]
   34 root     [kthrotld]
   35 root     [scsi_eh_0]
   36 root     [scsi_eh_1]
   37 root     [kworker/u:2]
   38 root     [kworker/u:3]
   57 root     [devfreq_wq]
   84 root     [kjournald]
   89 root     [flush-253:0]
  110 root     /sbin/syslogd -m 0
  112 root     /sbin/klogd
  138 root     /sbin/acpid
  185 root     udhcpc -p /var/run/udhcpc.eth0.pid -R -n -T 60 -i eth0 -s /sbin/cirros-dhcpc -O mtu -O staticroutes -x hostname cirr
  288 root     /usr/sbin/dropbear
  330 root     /sbin/getty -L 115200 ttyS0 vt100
  331 root     /sbin/getty 115200 tty1
  332 root     /usr/sbin/dropbear
  333 cirros   -sh
  337 cirros   ps -ef
$ exit
Connection to 172.24.4.9 closed.
%
```
