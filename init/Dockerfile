ARG from=scratch

FROM $from

ARG date="1970-01-01T00:00:00Z"
ARG license="MIT"
ARG rev="4b825dc642cb6eb9a060e54bf8d69288fbee4904"
ARG src="localhost"
ARG title="init: simple meta container that does initialization tasks for containers"
ARG url="github.com/skilouise/init"

LABEL org.opencontainers.image.created="$date"\
    org.opencontainers.image.licenses="$license"\
    org.opencontainers.image.revision="$rev"\
    org.opencontainers.image.source="$src"\
    org.opencontainers.image.title="$title"\
    org.opencontainers.image.url="$url"

COPY --from=skilouise/stch:latest /bin/stch /bin/stch
COPY --from=skilouise/stch:latest /bin/stch_dir /bin/stch_dir
COPY init /bin/init

ENTRYPOINT ["/bin/init"]
