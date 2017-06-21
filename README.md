# WORKSHOP OKTOCAMPUS - ANSIBLE


## Prerequisites
* VirtualBox
* Vagrant
* 6Go disk space

## Setup

```
# Clone the source
git clone https://github.com/cdelgehier/oktocampus_ansible.git

# run VM
vagrant up

# Connect to the managment node
vagrant ssh bastion

# Generate a ssh key
vagrant@bastion $> ssh-keygen -t rsa -b 2048

# Add target host key file to the known_hosts
vagrant@bastion $> ssh-keyscan prod1 prod2 rec1 rec2 > ~/.ssh/known_hosts
```

## Check installation
```
vagrant@bastion $> ansible --version
ansible 2.3.1.0
  config file = /home/vagrant/git/oktocampus/ansible.cfg
  configured module search path = Default w/o overrides
  python version = 2.7.5 (default, Nov  6 2016, 00:28:07) [GCC 4.8.5 20150623 (Red Hat 4.8.5-11)]

vagrant@bastion $> cat /etc/hosts
127.0.0.1	bastion	bastion
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
# vagrant environment nodes
10.0.15.10  bastion
10.0.15.21  prod1
10.0.15.22  prod2
10.0.15.51  rec1
10.0.15.52  rec2
```
