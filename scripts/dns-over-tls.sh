#!/bin/bash

$dot_file="/etc/NetworkManager/conf.d/global-dot.conf"

if [[ $EUID -ne 0 ]]; then
    echo "Script must run as root. Please, embrace the power of the super user." 1>&2
    exit 1
fi

if ! command -v dnsconfd &> /dev/null; then
    dnf install -y dnsconfd
fi

systemctl disable --now systemd-resolved
systemctl mask systemd-resolved
systemctl enable --now dnsconfd

if [ ! -f $dot_file ]; then
    echo "The tile $dot_file doesn't exist. The file need to be created..."
    touch "$dot_file"
    echo "ocus pocus, $dot_file created."
    
    cat $dot_file << EOF
    [main]
    dns=dnsconfd

    [global-dns]
    resolve-mode=exclusive

    [global-dns-domain-*]
    servers=dns+tls://1.1.1.1#one.one.one.one
    EOF
fi

