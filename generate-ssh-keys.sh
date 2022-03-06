#!/usr/bin/env bash
set -eEuo pipefail

# ssh-keygen -t -f rsa ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub
cat <<EOF >&2

SSH Keys copied to clipboard, go to https://github.com/settings/keys
and create a new key with a name. 
EOF

read -p "Press any key to continue ..."

