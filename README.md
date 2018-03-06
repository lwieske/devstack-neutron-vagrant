## OpenStack/Queens VM based on Devstack/Neutron

### Prerequisite: Vagrant

[Vagrant](http://www.vagrantup.org) uses [VirtualBox](http://www.virtualbox.org) to create virtual machines.

### Create OpenStack VM

    git clone http://github.com/lwieske/devstack-neutron-vagrant.git

    cd devstack-neutron-vagrant

    vagrant up

### Probe The Instance

    ping -c 7 172.24.4.2

Please verify the floating ip address to avoid problems.

    ssh cirros@172.24.4.2

    password: cubswin:)

The two special characters at the end are part of it.

### Lookup Dashboard

    open http://10.10.10.10

    username: demo / password: openstack

There you can navigate the security group `ping-secgroup` for ingress traffic
to the launched instance `ping-instance` and its associated floating ip.

```
cloudgate% vagrant destroy --force ; clear ; vagrant up
==> default: Forcing shutdown of VM...
==> default: Destroying VM and associated drives...
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
    default: Warning: Connection reset. Retrying...
    default: Warning: Remote connection disconnect. Retrying...
    default: Warning: Connection reset. Retrying...
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
    default: Ignore the previous error, fixing this now...
==> default: Running provisioner: shell...
    default: Running: inline script
    default: 2018-03-06 20:25:31.746 | stack.sh log /opt/stack/logs/stack.sh.log.2018-03-06-212531
    default: 2018-03-06 20:25:37.743 | Installing package prerequisites
    default: 2018-03-06 20:29:16.894 | Starting RabbitMQ
    default: 2018-03-06 20:29:59.810 | Installing OpenStack project source
    default: 2018-03-06 20:39:43.152 | Configuring and starting MySQL
    default: 2018-03-06 20:39:47.801 | Starting Keystone
    default: 2018-03-06 20:42:04.825 | Configuring Horizon
    default: 2018-03-06 20:43:16.544 | Configuring Glance
    default: 2018-03-06 20:43:21.793 | Configuring Neutron
    default: 2018-03-06 20:43:50.397 | Configuring Cinder
    default: 2018-03-06 20:43:54.788 | Configuring Nova
    default: 2018-03-06 20:44:37.593 | Configuring placement
    default: 2018-03-06 20:44:51.716 | Starting Glance
    default: 2018-03-06 20:44:55.048 | Uploading images
    default: 2018-03-06 20:45:01.516 | Starting Nova API
    default: 2018-03-06 20:45:08.638 | Starting Neutron
    default: 2018-03-06 20:45:12.001 | Starting Placement
    default: 2018-03-06 20:45:19.325 | Creating initial neutron network elements
    default: 2018-03-06 20:45:57.011 | Starting Nova
    default: 2018-03-06 20:46:24.405 | Starting Cinder
    default: 2018-03-06 20:46:31.988 | Starting Horizon
    default: 2018-03-06 20:47:20.657 | Configuring lvm.conf global device filter
    default: 2018-03-06 20:47:20.965 | set lvm.conf device global_filter to: global_filter = [ "a|loop0|", "a|loop1|", "a|sda5|", "r|.*|" ] # from devstack
    default:
    default: =========================
    default: DevStack Component Timing
    default:  (times are in seconds)
    default: =========================
    default: run_process           15
    default: test_with_retry        2
    default: apt-get-update         8
    default: pip_install          362
    default: osc                  137
    default: wait_for_service      19
    default: git_timed            260
    default: dbsync                22
    default: apt-get              224
    default: -------------------------
    default: Unaccounted time     262
    default: =========================
    default: Total runtime        1311
    default:
    default:
    default:
    default: This is your host IP address: 10.10.10.10
    default: This is your host IPv6 address: ::1
    default: Horizon is now available at http://10.10.10.10/dashboard
    default: Keystone is serving at http://10.10.10.10/identity/
    default: The default users are: admin and demo
    default: The password: openstack
    default:
    default: WARNING:
    default: Using lib/neutron-legacy is deprecated, and it will be removed in the future
    default:
    default: Services are running under systemd unit files.
    default: For more information see:
    default: https://docs.openstack.org/devstack/latest/systemd.html
    default: DevStack Version: queens
    default: Change:
    default: OS Version: Ubuntu 16.04 xenial
    default: 2018-03-06 20:47:21.133 | stack.sh completed in 1311 seconds.
    default: + export OS_AUTH_URL=http://10.10.10.10/identity/v3
    default: + OS_AUTH_URL=http://10.10.10.10/identity/v3
    default: + export OS_PROJECT_NAME=demo
    default: + OS_PROJECT_NAME=demo
    default: + export OS_USER_DOMAIN_NAME=Default
    default: + OS_USER_DOMAIN_NAME=Default
    default: + export OS_PROJECT_DOMAIN_ID=default
    default: + OS_PROJECT_DOMAIN_ID=default
    default: + export OS_USERNAME=demo
    default: + OS_USERNAME=demo
    default: + export OS_PASSWORD=openstack
    default: + OS_PASSWORD=openstack
    default: + export OS_REGION_NAME=RegionOne
    default: + OS_REGION_NAME=RegionOne
    default: + export OS_INTERFACE=public
    default: + OS_INTERFACE=public
    default: + export OS_IDENTITY_API_VERSION=3
    default: + OS_IDENTITY_API_VERSION=3
    default: + PING_FLAVOR=m1.tiny
    default: + PING_IMAGE=cirros-0.3.5-x86_64-disk
    default: + PING_INSTANCE=ping-instance
    default: + PING_SECGROUP=ping-secgroup
    default: + openstack security group create ping-secgroup --description ping-secgroup
    default: +-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------+
    default: | Field           | Value                                                                                                                                                 |
    default: +-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------+
    default: | created_at      | 2018-03-06T20:47:22Z                                                                                                                                  |
    default: | description     | ping-secgroup                                                                                                                                         |
    default: | id              | 76b7ea86-47e4-4513-9c24-a347a39782a8                                                                                                                  |
    default: | name            | ping-secgroup                                                                                                                                         |
    default: | project_id      | c29ee7ea28454ee69111dda0e8338742                                                                                                                      |
    default: | revision_number | 2                                                                                                                                                     |
    default: | rules           | created_at='2018-03-06T20:47:22Z', direction='egress', ethertype='IPv4', id='a458ef25-629f-4b7e-ba81-1477a2928546', updated_at='2018-03-06T20:47:22Z' |
    default: |                 | created_at='2018-03-06T20:47:22Z', direction='egress', ethertype='IPv6', id='e5374abd-3dbf-4b3f-831c-dc2f8d4abb22', updated_at='2018-03-06T20:47:22Z' |
    default: | updated_at      | 2018-03-06T20:47:22Z                                                                                                                                  |
    default: +-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------+
    default: + openstack security group rule create ping-secgroup --proto icmp --remote-ip 0.0.0.0/0 --dst-port -1
    default: +-------------------+--------------------------------------+
    default: | Field             | Value                                |
    default: +-------------------+--------------------------------------+
    default: | created_at        | 2018-03-06T20:47:24Z                 |
    default: | description       |                                      |
    default: | direction         | ingress                              |
    default: | ether_type        | IPv4                                 |
    default: | id                | f790a101-9638-482a-b817-73b855dc7a6c |
    default: | name              | None                                 |
    default: | port_range_max    | None                                 |
    default: | port_range_min    | None                                 |
    default: | project_id        | c29ee7ea28454ee69111dda0e8338742     |
    default: | protocol          | icmp                                 |
    default: | remote_group_id   | None                                 |
    default: | remote_ip_prefix  | 0.0.0.0/0                            |
    default: | revision_number   | 0                                    |
    default: | security_group_id | 76b7ea86-47e4-4513-9c24-a347a39782a8 |
    default: | updated_at        | 2018-03-06T20:47:24Z                 |
    default: +-------------------+--------------------------------------+
    default: + openstack security group rule create ping-secgroup --proto tcp --remote-ip 0.0.0.0/0 --dst-port 22
    default: +-------------------+--------------------------------------+
    default: | Field             | Value                                |
    default: +-------------------+--------------------------------------+
    default: | created_at        | 2018-03-06T20:47:25Z                 |
    default: | description       |                                      |
    default: | direction         | ingress                              |
    default: | ether_type        | IPv4                                 |
    default: | id                | 0c0108cc-0be2-46a2-b9d1-ac19f003170e |
    default: | name              | None                                 |
    default: | port_range_max    | 22                                   |
    default: | port_range_min    | 22                                   |
    default: | project_id        | c29ee7ea28454ee69111dda0e8338742     |
    default: | protocol          | tcp                                  |
    default: | remote_group_id   | None                                 |
    default: | remote_ip_prefix  | 0.0.0.0/0                            |
    default: | revision_number   | 0                                    |
    default: | security_group_id | 76b7ea86-47e4-4513-9c24-a347a39782a8 |
    default: | updated_at        | 2018-03-06T20:47:25Z                 |
    default: +-------------------+--------------------------------------+
    default: + openstack server create --image cirros-0.3.5-x86_64-disk --flavor m1.tiny --security-group ping-secgroup ping-instance
    default: +-----------------------------+-----------------------------------------------------------------+
    default: | Field                       | Value                                                           |
    default: +-----------------------------+-----------------------------------------------------------------+
    default: | OS-DCF:diskConfig           | MANUAL                                                          |
    default: | OS-EXT-AZ:availability_zone |                                                                 |
    default: | OS-EXT-STS:power_state      | NOSTATE                                                         |
    default: | OS-EXT-STS:task_state       | scheduling                                                      |
    default: | OS-EXT-STS:vm_state         | building                                                        |
    default: | OS-SRV-USG:launched_at      | None                                                            |
    default: | OS-SRV-USG:terminated_at    | None                                                            |
    default: | accessIPv4                  |                                                                 |
    default: | accessIPv6                  |                                                                 |
    default: | addresses                   |                                                                 |
    default: | adminPass                   | ZY65tcENH8C6                                                    |
    default: | config_drive                |                                                                 |
    default: | created                     | 2018-03-06T20:47:28Z                                            |
    default: | flavor                      | m1.tiny (1)                                                     |
    default: | hostId                      |                                                                 |
    default: | id                          | 1f0fea0c-2a61-4fb1-84ec-0638e6fe6859                            |
    default: | image                       | cirros-0.3.5-x86_64-disk (2408f07c-9ce5-4f3b-ab1e-c4228b898df5) |
    default: | key_name                    | None                                                            |
    default: | name                        | ping-instance                                                   |
    default: | progress                    | 0                                                               |
    default: | project_id                  | c29ee7ea28454ee69111dda0e8338742                                |
    default: | properties                  |                                                                 |
    default: | security_groups             | name='76b7ea86-47e4-4513-9c24-a347a39782a8'                     |
    default: | status                      | BUILD                                                           |
    default: | updated                     | 2018-03-06T20:47:27Z                                            |
    default: | user_id                     | c34d2ded342646bb89db16981e4bfe36                                |
    default: | volumes_attached            |                                                                 |
    default: +-----------------------------+-----------------------------------------------------------------+
    default: + openstack floating ip create public
    default: +---------------------+--------------------------------------+
    default: | Field               | Value                                |
    default: +---------------------+--------------------------------------+
    default: | created_at          | 2018-03-06T20:47:30Z                 |
    default: | description         |                                      |
    default: | fixed_ip_address    | None                                 |
    default: | floating_ip_address | 172.24.4.2                           |
    default: | floating_network_id | c16cc453-e988-4f23-b8e1-c3049caef093 |
    default: | id                  | a2085643-f85a-44f7-84b3-bbc434c060db |
    default: | name                | 172.24.4.2                           |
    default: | port_id             | None                                 |
    default: | project_id          | c29ee7ea28454ee69111dda0e8338742     |
    default: | qos_policy_id       | None                                 |
    default: | revision_number     | 0                                    |
    default: | router_id           | None                                 |
    default: | status              | DOWN                                 |
    default: | subnet_id           | None                                 |
    default: | updated_at          | 2018-03-06T20:47:30Z                 |
    default: +---------------------+--------------------------------------+
    default: ++ openstack floating ip list -c 'Floating IP Address'
    default: ++ sed -n 4,4p
    default: ++ awk '{print $2;}'
    default: + FLOATING_IP=172.24.4.2
    default: + openstack server add floating ip ping-instance 172.24.4.2
cloudgate%
```
