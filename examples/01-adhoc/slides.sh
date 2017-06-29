ansible prod -m ping
ansible prod -m command -a 'whoami'
ansible prod -m setup
ansible prod -a 'hostnamectl'
#ansible all -a '/sbin/reboot' --forks=10
ansible recette -m user -a 'name=georges password=okto'
ansible all -m yum -a 'name=nginx state=installed'
ansible all -m service -a 'name=nginx state=started'

ansible all --list-hosts
ansible localhost -m debug -a 'var=groups.keys()'
