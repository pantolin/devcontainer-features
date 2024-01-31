#!/usr/bin/env bash
set -e

echo "Activating feature 'zsh'"

# Clean up
rm -rf /var/lib/apt/lists/*

echo "Step 1, check if user is root"
if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

echo "Step 2, determine appropriate non-root user"
if [ "${USERNAME}" = "auto" ] || [ "${USERNAME}" = "automatic" ]; then
    USERNAME=""
    POSSIBLE_USERS=("vscode" "node" "codespace" "$(awk -v val=1000 -F ":" '$3==val{print $1}' /etc/passwd)")
    for CURRENT_USER in "${POSSIBLE_USERS[@]}"; do
        if id -u "${CURRENT_USER}" >/dev/null 2>&1; then
            USERNAME=${CURRENT_USER}
            break
        fi
    done
    if [ "${USERNAME}" = "" ]; then
        USERNAME=root
    fi
elif [ "${USERNAME}" = "none" ] || ! id -u ${USERNAME} >/dev/null 2>&1; then
    USERNAME=root
fi

export DEBIAN_FRONTEND=noninteractive

echo "Step 3, check if architecture is supported"
architecture="$(uname -m)"
if [ "${architecture}" != "amd64" ] && [ "${architecture}" != "x86_64" ] && [ "${architecture}" != "arm64" ] && [ "${architecture}" != "aarch64" ]; then
    echo "(!) Architecture $architecture unsupported"
    exit 1
fi

echo "Step 4, install package"
apt update -y
apt install -y bat

echo "Step 5, create symbolic link"
ln -s /usr/bin/batcat /usr/local/bin/bat


echo "Step 6, clean up"
rm -rf /var/lib/apt/lists/*

echo "Done!"