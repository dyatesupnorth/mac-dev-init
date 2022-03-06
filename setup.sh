#!/bin/bash 
set -eEuo pipefail

./install-xcode.sh
./generate-ssh-keys.sh
./install-ansible.sh
./pull-ansible-setup.sh