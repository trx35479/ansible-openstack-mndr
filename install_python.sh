#!/bin/bash -eux
#sudo dnf update -y
sudo subscription-manager register --username=rowel.uchi@unico.com.au --password=Maxbella1
sudo subscription-manager attach
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install python-pip
sudo pip install --upgrade pip
sudo pip install --upgrade setuptools
sudo yum -y install ansible
