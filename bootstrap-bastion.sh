#!/usr/bin/env bash

# Ansible installation
yum install --enablerepo=extras epel-release -y

yum install -y python-pip gcc python-devel libffi-devel openssl-devel sshpass git docker vim
/usr/bin/pip install --upgrade pip
/usr/bin/pip install --upgrade setuptools
/usr/bin/pip install ansible


# DOCKER
cat > /etc/docker/daemon.json << EOF
{
    "live-restore": true,
    "group": "dockerroot"
}
EOF
service docker start
usermod -aG dockerroot vagrant
docker pull bertvv/ansible-testing:centos_7
docker pull hello-world

#VIM
install -d -o vagrant -g vagrant -m 750 /home/vagrant/.vim/{autoload,bundle}
curl -LSso /home/vagrant/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cat >> /home/vagrant/.vimrc <<EOF
execute pathogen#infect()
syntax on
filetype plugin indent on

" Indentation related
set tabstop=4 " How many spaces for a tab
set expandtab " Expand tab to spaces
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

" View related
"set cursorline " Highlight cursor line
set showmatch " Match brackets
"set number " Line Numbers
syntax enable
set paste

" Search related
set incsearch " Incremental search
set hlsearch " Highlight search
set ignorecase
set smartcase " Ignore ignorecase when uppercase characters are present

" Navigation related
set scrolloff=3 " Minimum number of lines to show below/above the cursor

" Theming
colorscheme delek
EOF
su - vagrant -c "cd /home/vagrant/.vim/bundle && git clone https://github.com/pearofducks/ansible-vim && git clone https://github.com/Glench/Vim-Jinja2-Syntax"
echo vi=vim >> /home/vagrant/.bashrc

# get examples on github
install -d -o vagrant -g vagrant -m 755 /home/vagrant/git/oktocampus
su - vagrant -c "git clone https://github.com/cdelgehier/oktocampus_ansible.git /home/vagrant/git/oktocampus"


# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOF

# vagrant environment nodes
10.0.15.10  bastion
10.0.15.21  prod1
10.0.15.22  prod2
10.0.15.51  rec1
10.0.15.52  rec2
EOF
