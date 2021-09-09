ARG from=alpine:3.14.2

FROM $from

ARG date="1970-01-01T00:00:00Z"
ARG license="MIT"
ARG rev="4b825dc642cb6eb9a060e54bf8d69288fbee4904"
ARG src="localhost"
ARG title="NGINX: Dynamic templating, optimized defaults, proper healthchecks"
ARG url="www.nginx.com"

LABEL org.opencontainers.image.created="$date"\
    org.opencontainers.image.licenses="$license"\
    org.opencontainers.image.revision="$rev"\
    org.opencontainers.image.source="$src"\
    org.opencontainers.image.title="$title"\
    org.opencontainers.image.url="$url"

ENV WORKDIR="/var/www"
ENV GROUP_ID="8080"

WORKDIR ${WORKDIR}

RUN set -eu; apk --update add --no-cache nginx && rm -rf /etc/nginx/* /etc/conf.d/* /etc/init.d/*
COPY --from=skilouise/init:latest /bin/* /bin/
COPY root /

ENTRYPOINT ["/bin/init"]
CMD ["nginx"]
HEALTHCHECK --interval=10s --timeout=5s\
    CMD wget --spider -S http://localhost:8080 2>&1 > /dev/null | grep -q "200 OK$"

EXPOSE 8080
