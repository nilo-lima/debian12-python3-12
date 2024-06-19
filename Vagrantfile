# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.define "python312" do |general|
      general.vm.box = "debian/bookworm64"
      general.vm.hostname = "python312.domain.local"      
      ## Port 80
      general.vm.network "forwarded_port", guest: 80, host:80
      ## Port 443
      general.vm.network "forwarded_port", guest: 80, host:80
      ## Port 8000
      general.vm.network "forwarded_port", guest: 8000, host:8000
      general.vm.network "private_network", ip: "192.168.56.248"
      general.vm.provider "virtualbox" do |vb|
        vb.memory = 1024
        vb.cpus = 1
        vb.name = "python312"
      end
      general.vm.provision "shell", path: "setup.sh"
    end
  end