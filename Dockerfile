FROM alpine:3.5
MAINTAINER George Kutsurua <g.kutsurua@gmail.com>

RUN apk add --no-cache nginx openssl ca-certificates

RUN cd /tmp &&\
    wget https://github.com/bitly/oauth2_proxy/releases/download/v2.1/oauth2_proxy-2.1.linux-amd64.go1.6.tar.gz &&\
    tar -xzvf oauth2_proxy*.tar.gz &&\
    mv oauth2_proxy*/* /usr/sbin/ &&\
    rm -rf /tmp/* /var/cache/apk/*

ENTRYPOINT ["/usr/sbin/nginx"]
