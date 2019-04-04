ARG VERSION

FROM chethanuk/presto-base:${VERSION}
MAINTAINER chethanuk

COPY etc /usr/local/presto/etc
EXPOSE 8081

WORKDIR /usr/local/presto
ENTRYPOINT [ "./scripts/presto.sh" ]
