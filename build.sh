#!/bin/bash

in_file=ansible-ssh.sh.j2
out_file=ansible-ssh

cd "$(dirname $0)"

ansible -i 'localhost,' localhost --connection local -m template -a "src=$in_file dest=$out_file"
