ARG VERSION

FROM chethanuk/presto-base:${VERSION}
MAINTAINER chethanuk

ADD etc /usr/local/presto/etc

EXPOSE 8080

WORKDIR /usr/local/presto
ENTRYPOINT ["./scripts/presto.sh"]
