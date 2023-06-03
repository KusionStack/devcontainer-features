#!/bin/sh

set -eux

# Kusion version
VERSION=${VERSION:-"0.8.1"}
KUSION_URL="https://github.com/KusionStack/kusion/releases/download/v${VERSION}/kusion_${VERSION}_linux_amd64.tar.gz"
KUSION_LOCATION="/home/vscode/.kusion"
# todo: this should be installed directly from the kcl language server release
KCLVM_URL="https://github.com/KusionStack/kcl/releases/download/v0.5.0-alpha.1/kclvm-v0.5.0-alpha.1-linux-amd64.tar.gz"

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

# install kcl language server
# todo: this should be installed directly from the kcl language server release
mkdir ${KUSION_LOCATION}/kcl
wget -c  ${KCLVM_URL} -qO - | tar xz -C ${KUSION_LOCATION}/kcl
cp ${KUSION_LOCATION}/kcl/kclvm/bin/kcl-language-server ${KUSION_LOCATION}
rm -rf ${KUSION_LOCATION}/kcl

# ensure that the kusion install path has correct privs
chown -R $USERNAME ${KUSION_LOCATION}
chmod -R u+wrx ${KUSION_LOCATION}

# check the user permission
ls -al ${KUSION_LOCATION}
