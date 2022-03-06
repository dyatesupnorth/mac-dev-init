#!/usr/bin/env bash
set -eEuo pipefail

if grep -q "version" <<< xcode-select --version; then
    cat <<EOF >&2
xcode seems to already be installed.
EOF
else
    xcode-select --install 
fi
