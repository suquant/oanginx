FROM alpine:3.5
MAINTAINER George Kutsurua <g.kutsurua@gmail.com>

RUN apk add --no-cache nginx openssl

RUN cd /tmp &&\
    wget https://github.com/bitly/oauth2_proxy/releases/download/v2.1/oauth2_proxy-2.1.linux-amd64.go1.6.tar.gz &&\
    mv oauth2_proxy*/* /usr/sbin/ &&\
    apk del go musl-dev --force && \
    rm -rf /tmp/* /var/cache/apk/*

ENTRYPOINT ["/usr/sbin/nginx"]
