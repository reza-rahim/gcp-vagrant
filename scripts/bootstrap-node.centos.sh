#!/usr/bin/env bash

#cat  /vagrant/scripts/authorized_keys >> /home/vagrant/.ssh/authorized_keys

sudo mkdir -p /home/vagrant/.ssh
cat  /vagrant/scripts/authorized_keys >> /home/vagrant/.ssh/authorized_keys

cp -a /vagrant/scripts/id_rsa /home/vagrant/.ssh/id_rsa
cat  /vagrant/scripts/authorized_keys >> /home/vagrant/.ssh/authorized_keys

chown -R vagrant:vagrant /home/vagrant/.ssh/id_rsa
chown -R vagrant:vagrant /home/vagrant/.ssh/authorized_keys
chmod 600 /home/vagrant/.ssh/id_rsa

sudo mkdir -p /root/.ssh
sudo bash -c 'cat  /vagrant/scripts/authorized_keys >> /root/.ssh/authorized_keys'

# configure hosts file for our internal network defined by Vagrantfile
cat > /etc/hosts <<EOL

# vagrant environment nodes
127.0.0.1   localhost

192.168.50.2  node2
192.168.50.3  node3
192.168.50.4  node4
192.168.50.5  node5
192.168.50.6  node6
192.168.50.7  node7
192.168.50.8  node8
192.168.50.9  node9
EOL

#sudo echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables
