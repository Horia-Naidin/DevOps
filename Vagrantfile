# -*- mode: ruby -*-
# vi: set ft=ruby :

$jenkins_install = <<SCRIPT

sudo apt update
sudo apt install fontconfig openjdk-17-jre -y

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y

SCRIPT

$docker_install = <<SCRIPT 

sudo apt update
sudo apt install docker.io -y

SCRIPT

$ansible_install = <<SCRIPT

sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

SCRIPT


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
