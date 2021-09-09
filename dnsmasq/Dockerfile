ARG from=alpine:3.14.2

FROM $from

ARG date="1970-01-01T00:00:00Z"
ARG license="GPL-2.0-or-later"
ARG rev="4b825dc642cb6eb9a060e54bf8d69288fbee4904"
ARG src="localhost"
ARG title="DNSMasq: DNS, TFTP, DHCP server w/ a ipxe.efi and optimized defaults"
ARG url="thekelleys.org.uk/dnsmasq/doc.html"

LABEL org.opencontainers.image.created="$date"\
    org.opencontainers.image.licenses="$license"\
    org.opencontainers.image.revision="$rev"\
    org.opencontainers.image.source="$src"\
    org.opencontainers.image.title="$title"\
    org.opencontainers.image.url="$url"

RUN set -eu; apk --update add --no-cache dnsmasq-dnssec &&\
    rm -rf /etc/init.d /etc/conf.d /etc/dnsmasq.d /etc/dnsmasq.conf
RUN set -eu; mkdir -p /var/lib/dnsmasq/tftp &&\
    cd /var/lib/dnsmasq/tftp && wget https://boot.ipxe.org/ipxe.efi &&\
    chown -R dnsmasq:dnsmasq /var/lib/dnsmasq

COPY --from=skilouise/init:latest /bin/* /bin/

ENTRYPOINT ["/bin/init"]
CMD ["dnsmasq", "--keep-in-foreground", "--log-async=100", "--log-facility=-", "--tftp-root=/var/lib/dnsmasq/tftp"]

# DNS
EXPOSE 53/udp
# BOOTP
EXPOSE 67/udp
# TFTP
EXPOSE 69/udp
# Altserviceboot - ProxyDHCP
EXPOSE 4011/udp
