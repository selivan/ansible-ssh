# ansible-ssh

Ansible installation has all necessary parameters for connecting to managed hosts. Duplicationg this parameters in `~/.ssh/config` is not convenient, especially if dynamic inventory is used.

This script parses ansible configuration to get that parameters. Just place it somewhere in your `$PATH`, for example `~/.local/bin`. 

Inventory variables: `ansible_host`, `ansible_ssh_host`, `ansible_user`, `ansible_ssh_user`, `ansible_port`, `ansible_ssh_port`, `ansible_ssh_common_args`.
Configuration variables: `ssh_args`.

How it works:

```bash
user@work$ cd my_ansible_repo
user@work$ cat hosts | grep server1
server1 ansible_host=192.168.0.1 ansible_user=ubuntu ansible_port=2222
user@work$ cat ansible.cfg | grep ssh_args
ssh_args = -C -o ControlMaster=auto -o ControlPersist=60s
user@work$ ansible-ssh server1
ssh_args:  -C -o ControlMaster=auto -o ControlPersist=60s
ansible_host: 192.168.0.1
ansible_user: ubuntu
ansible_port: 2222
ansible_ssh_common_args:
result command: ssh ubuntu@192.168.0.1 -C -o ControlMaster=auto -o ControlPersist=60s -p 2222
ubuntu@server1$
```

# Requirements

* ansible
* [jq](https://stedolan.github.io/jq/)
