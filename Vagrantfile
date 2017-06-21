# Defines our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # create bastion node
  config.vm.define :bastion do |bastion|
      bastion.vm.box = "centos/7"
      bastion.vm.hostname = "bastion"
      bastion.vm.network :private_network, ip: "10.0.15.10"
      bastion.ssh.insert_key = 'true'
      bastion.vm.provider "virtuaprodox" do |vb|
        vb.memory = "256"
      end
      bastion.vm.provision :shell, path: "bootstrap-bastion.sh"
  end

  # production
  (1..2).each do |i|
    config.vm.define "prod#{i}" do |node|
        node.vm.box = "centos/7"
        node.vm.hostname = "prod#{i}"
        node.vm.network :private_network, ip: "10.0.15.2#{i}"
        node.vm.network "forwarded_port", guest: 80, host: "808#{i}"
        node.ssh.insert_key = 'true'

        node.vm.provider "virtuaprodox" do |vb|
          vb.memory = "256"
        end

	node.vm.provision "accept ssh password",
          type: "shell",
          preserve_order: true,
          inline: "sed -i -e 's@PasswordAuthentication no@PasswordAuthentication yes@' /etc/ssh/sshd_config"
	node.vm.provision "sshdi restart",
          type: "shell",
          preserve_order: true,
          inline: "service sshd restart"
    end
  end

  # recette
  (1..2).each do |i|
    config.vm.define "rec#{i}" do |node|
        node.vm.box = "centos/7"
        node.vm.hostname = "rec#{i}"
        node.vm.network :private_network, ip: "10.0.15.5#{i}"
        node.vm.network "forwarded_port", guest: 80, host: "909#{i}"
        node.vm.provider "virtuaprodox" do |vb|
          vb.memory = "256"
        end
        node.vm.provision "accept ssh password",
          type: "shell",
          preserve_order: true,
          inline: "sed -i -e 's@PasswordAuthentication no@PasswordAuthentication yes@' /etc/ssh/sshd_config"
        node.vm.provision "sshdi restart",
          type: "shell",
          preserve_order: true,
          inline: "service sshd restart"
    end

    end


end
