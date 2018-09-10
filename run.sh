#!/usr/bin/dumb-init /bin/bash
set -euxo pipefail

mkdir -p /dev/net
[ -c /dev/net/tun ] || mknod /dev/net/tun c 10 200

[ -f /etc/openvpn/dh2048.pem ] || openssl dhparam -out /etc/openvpn/dh2048.pem 2048

exec openvpn "$@"
