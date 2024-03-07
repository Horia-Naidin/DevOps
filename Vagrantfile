# -*- mode: ruby -*-
# vi: set ft=ruby :

require './require/install_jenkins'
require './require/install_docker'
require './require/install_ansible'


Vagrant.configure("2") do |config|

  config.vm.define "mainVM" do |server1|
    server1.vm.box = "ubuntu/bionic64"
     config.vm.provider "virtualbox" do |mainVM|      
      mainVM.memory = "3072"
      mainVM.cpus = "3"
     end
   server1.vm.network "private_network", ip: "192.168.56.10"	
   # install jenkins + docker + ansible + authorized_keys
   server1.vm.provision "shell", inline: 
      $jenkins_install
   server1.vm.provision "shell", inline:
      $docker_install
   server1.vm.provision "shell", inline:
      $ansible_install

   end
  
  config.vm.define "appliVM" do |server2|
    server2.vm.box = "ubuntu/bionic64"
     config.vm.provider "virtualbox" do |appliVM|      
     appliVM.memory = "3072"
     appliVM.cpus = "4"
     end
    server2.vm.network "private_network", ip: "192.168.56.11"	
    server2.vm.provision "shell", inline: 
    # install docker + add authorized key  + docker
     $docker_install

   end
  end
