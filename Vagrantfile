# -*- mode: ruby -*-
# vi: set ft=ruby :

BOXNAME    = "devstack-neutron-vagrant"

$script = <<INLINE

export DEBIAN_FRONTEND=noninteractive ; set -ex

timedatectl set-timezone Europe/Berlin
dpkg-reconfigure -f noninteractive tzdata

apt-get update              > /dev/null
apt-get -y install git-core > /dev/null

ip link set dev enp0s9 up

su vagrant -c "git clone git://github.com/openstack-dev/devstack.git -b stable/ocata &> /dev/null"
su vagrant -c "cp /vagrant/local.conf devstack                                                   "
su vagrant -c "devstack/stack.sh                                                     2> /dev/null"

ovs-vsctl add-port br-ex enp0s9

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o enp0s8 -j MASQUERADE

su vagrant -c "bash -x /vagrant/launch-instance.sh"

sleep 30

INLINE

##################################

Vagrant.configure("2") do |config|

  config.vm.box            = "bento/ubuntu-16.04"

  config.vm.hostname       = BOXNAME
  config.cache.auto_detect = true

  config.vm.network :private_network, ip: "10.10.10.10"
  config.vm.network :private_network, ip: "172.24.4.225",
    :netmask => "255.255.255.0", :auto_config => false

  config.vm.provider "virtualbox" do |vbox|
    vbox.name = BOXNAME
    vbox.customize ["modifyvm", :id, "--cpus",                "4"]
    vbox.customize ["modifyvm", :id, "--memory",           "8192"]
    vbox.customize ["modifyvm", :id, "--nicpromisc3", "allow-all"]
  end

  config.vm.provision :shell , inline: "(grep -q 'mesg n' /root/.profile && sed -i '/mesg n/d' /root/.profile && echo 'Ignore the previous error, fixing this now...') || exit 0;"

  config.vm.provision :shell, :inline => $script

end
