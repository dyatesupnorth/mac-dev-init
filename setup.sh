#!/bin/bash 
set -eEuo pipefail

if grep -q "version" <<< xcode-select --version; then
    cat <<EOF >&2
xcode seems to already be installed.
EOF
else
    xcode-select --install 
fi

ssh-keygen q -N ''
pbcopy < ~/.ssh/id_rsa.pub
cat <<EOF >&2

SSH Keys copied to clipboard, go to https://github.com/settings/keys
and create a new key with a name. 
EOF

read -p "Press any key to continue ..."

export PATH="$HOME/Library/Python/3.8/bin:/opt/homebrew/bin:$PATH"
sudo pip3 install --upgrade pip
pip3 install ansible

BASE_DIRECTORY="$HOME/scripts"

if [ ! -d "$BASE_DIRECTORY" ]; then
  mkdir ~/scripts

fi

PLAYBOOK_DIR="$HOME/scripts/mac-dev-playbook"


if [ ! -d "$PLAYBOOK_DIR" ] ; then
    git clone git@github.com:dyatesupnorth/mac-dev-playbook.git "$PLAYBOOK_DIR"
else
    cd "$PLAYBOOK_DIR"
    git pull git@github.com:dyatesupnorth/mac-dev-playbook.git
    ansible-galaxy install -r requirements.yml
    ansible-playbook main.yml --ask-become-pass
fi
