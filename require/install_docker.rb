# -*- mode: ruby -*-
# vi: set ft=ruby :

#-------docker installation--------

$docker_install = <<SCRIPT 

sudo apt update
sudo apt install docker.io -y

SCRIPT
