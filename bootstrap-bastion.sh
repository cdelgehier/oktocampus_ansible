#!/usr/bin/env bash

# Ansible installation
yum install --enablerepo=extras epel-release -y

yum install -y python-pip gcc python-devel libffi-devel openssl-devel sshpass git
/usr/bin/pip install --upgrade pip
/usr/bin/pip install --upgrade setuptools
/usr/bin/pip install ansible

# copy examples
install -d -o vagrant -g vagrant -m 755 /home/vagrant/git/oktocampus
cp -a /vagrant/examples/* /home/vagrant/git/oktocampus

# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL
# vagrant environment nodes
10.0.15.10  bastion
10.0.15.21  prod1
10.0.15.22  prod2
10.0.15.51  rec1
10.0.15.52  rec2
EOL
