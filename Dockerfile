FROM alpine:3.8

LABEL maintainer Knut Ahlers <knut@ahlers.me>

RUN set -ex \
 && apk --no-cache add \
      bash \
      curl \
      groff \
      jq \
      less \
      openssl \
      openvpn \
      py-pip \
      python \
 && curl -sSfLo /usr/bin/dumb-init "https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64" \
 && chmod +x /usr/bin/dumb-init \
 && curl -sSfL "https://github.com/Luzifer/vault2env/releases/download/v1.1.1/vault2env_linux_amd64.tar.gz" | tar -xzv -C /usr/bin \
 && ln -sf /usr/bin/vault2env_linux_amd64 /usr/bin/vault2env \
 && pip install --upgrade awscli \
 && apk --no-cache --purge del \
      py-pip

COPY run.sh /usr/bin/

VOLUME ["/etc/openvpn"]

EXPOSE 1194/udp 1194/tcp

ENTRYPOINT ["/usr/bin/run.sh"]
CMD ["--config", "/etc/openvpn/server.conf"]
