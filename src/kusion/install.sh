#!/bin/sh

set -eux

# Kusion version
VERSION=${VERSION:-"v0.7.1"}
KUSION_URL="https://github.com/KusionStack/kusion/releases/download/${VERSION}/kusion-ubuntu.tgz"
KUSION_LOCATION="/home/vscode/.kusion"

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

echo "check dependency packages..."
# Checks if packages are installed and installs them if not
check_packages() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            echo "Running apt-get update..."
            apt-get update -y
        fi
        apt-get -y install --no-install-recommends "$@"
    fi
}

# Install dependencies
check_packages wget ca-certificates

echo "Activating feature 'Kusion'"
mkdir -p ${KUSION_LOCATION}

# install Kusion pack
wget -c  ${KUSION_URL} -qO - | tar xz -C ${KUSION_LOCATION}
# the kusion bin location is added to path by devcontainer-feature.json file

# ensure that the kusion install path has correct privs
chown -R $USERNAME ${KUSION_LOCATION}
chmod -R u+wrx ${KUSION_LOCATION}

# check the user permission
ls -al ${KUSION_LOCATION}/bin
