# luzifer-docker / openvpn

Run OpenVPN with support for accessing Vault and AWS for learn-address scripts in a Docker container

## Usage

```bash
## Build container (optional)
$ docker build -t luzifer/openvpn .

## Execute openvpn
$ docker run --rm -ti -v $(pwd):/etc/openvpn -p 1194:1194/udp luzifer/openvpn
```
