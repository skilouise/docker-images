FROM busybox:1.34.0-musl

ARG date="1970-01-01T00:00:00Z"
ARG revision="4b825dc642cb6eb9a060e54bf8d69288fbee4904"
ARG source="localhost"
ARG title="stch: simple sed based templating"

LABEL org.opencontainers.image.created=${date}\
    org.opencontainers.image.description=${description}\
    org.opencontainers.image.revision=${revision}\
    org.opencontainers.image.title=${title}

COPY ./stch /bin
COPY ./stch_dir /bin

ENTRYPOINT ["/bin/init"]
