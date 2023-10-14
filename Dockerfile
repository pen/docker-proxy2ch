FROM alpine:latest AS builder

ARG NOTABUG_PX2C_HASH="0c97e3b5e6"

RUN apk --update-cache add \
    curl-dev \
    g++ \
    gnu-libiconv-dev \
    lua5.4-dev \
    make \
    patch

WORKDIR /root
RUN wget https://notabug.org/NanashiNoGombe/proxy2ch/archive/${NOTABUG_PX2C_HASH}.tar.gz
RUN tar xzvf ${NOTABUG_PX2C_HASH}.tar.gz

WORKDIR /root/proxy2ch
COPY patch/ /tmp/
RUN patch -p1 < /tmp/alpine.patch
RUN make


FROM alpine:latest
LABEL org.opencontainers.image.authors="Abe Masahiro <pen@thcomp.org>" \
    org.opencontainers.image.source="https://github.com/pen/docker-proxy2ch"

RUN apk --no-cache add \
    libcurl \
    libstdc++ \
    lua5.4-libs

COPY --from=builder /root/proxy2ch/proxy2ch /usr/local/bin/
COPY rootfs/ /

VOLUME /ext
EXPOSE 9080

CMD ["/etc/rc.entry"]
