# Defines our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

  # create mgmt node
  config.vm.define :mgmt do |mgmt_config|
      mgmt_config.vm.box = "bento/centos-7.6"
      mgmt_config.vm.hostname = "mgmt"
      mgmt_config.vm.network :private_network, ip: "192.168.50.0"
      mgmt_config.vm.provider "virtualbox" do |vb|
        #vb.memory = "1024"
        #vb.cpus = "2"
      end
      mgmt_config.vm.provision :shell, path: "scripts/bootstrap-mgmt.centos.sh"
  end
  
  # https://docs.vagrantup.com/v2/vagrantfile/tips.html
  (1..3).each do |i|
    config.vm.define "node#{i}" do |node|
        node.vm.box = "bento/centos-7.6"
        node.vm.hostname = "node#{i}"
        node.vm.network :private_network, ip: "192.168.50.#{i}"
        node.vm.provider "virtualbox" do |vb|
          #vb.memory = "2560"
          #vb.cpus = "4"
        end
        node.vm.provision :shell, path: "scripts/bootstrap-node.centos.sh"
    end
  end
end
