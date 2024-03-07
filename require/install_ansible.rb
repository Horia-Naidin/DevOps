# -*- mode: ruby -*-
# vi: set ft=ruby :

#install ansible

$ansible_install = <<SCRIPT

sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

SCRIPT
