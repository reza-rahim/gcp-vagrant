#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
sudo apt-get update
sudo apt-get -y install software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible

export codeName=$(lsb_release -c | cut -f 2)
sudo apt-get -y install ansible=2.7.0-1ppa~${codeName}

#sudo apt-get -y install python-pip python-dev
#sudo pip  install ansible=2.7
#sudo pip  install httplib2==0.7.7
#sudo mkdir /etc/ansible/

sudo apt-get -y install git
sudo git config --global user.name "Reza Rahim"

# copy examples into /home/vagrant (from inside the mgmt node)
cp -a /vagrant/ansible/ /home/vagrant/ansible
chown -R vagrant:vagrant /home/vagrant

#cp -a /vagrant/mesos* /home/vagrant/

chmod 755  /home/vagrant/*.sh

chown -R vagrant:vagrant /home/vagrant

cp -a /vagrant/scripts/id_rsa /home/vagrant/.ssh/id_rsa
cat  /vagrant/scripts/authorized_keys >> /home/vagrant/.ssh/authorized_keys

chown -R vagrant:vagrant /home/vagrant/.ssh/id_rsa
chmod 600 /home/vagrant/.ssh/id_rsa

chown -R vagrant:vagrant /home/vagrant/.ssh/authorized_keys

cat >> /home/vagrant/.ssh/config <<EOL
Host *
  StrictHostKeyChecking no
EOL

cp -a ansible/inventory.ini /etc/ansible/hosts

# configure hosts file for our internal network defined by Vagrantfile
cat > /etc/hosts <<EOL

# vagrant environment nodes
127.0.0.1   localhost
10.0.15.10  mgmt logserver dckreg
10.0.15.11  node1 api
10.0.15.12  node2
10.0.15.13  node3
10.0.15.14  node4
10.0.15.15  node5
10.0.15.16  node6
10.0.15.17  node7
EOL

cat > /home/vagrant/.gitconfig <<EOL
[user]
        name = Reza Rahim
        email = rahimre@yahoo.com
EOL
