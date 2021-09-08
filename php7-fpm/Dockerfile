ARG from=alpine:3.14.2

FROM $from

ARG date="1970-01-01T00:00:00Z"
ARG license="PHP-3.0"
ARG rev="4b825dc642cb6eb9a060e54bf8d69288fbee4904"
ARG src="localhost"
ARG title="php7-fpm: Optimized settings and installed with least dependencies and most reverse dependent modules"
ARG url="www.php.net"

LABEL org.opencontainers.image.created="$date"\
    org.opencontainers.image.licenses="$license"\
    org.opencontainers.image.revision="$rev"\
    org.opencontainers.image.source="$src"\
    org.opencontainers.image.title="$title"\
    org.opencontainers.image.url="$url"

ENV WORKDIR="/var/www"
ENV USERID="7068"
ENV GROUPID="8080"

WORKDIR ${WORKDIR}

# Dependencies and reverse dependencies taken from https://pkgs.alpinelinux.org/packages
RUN set -eu; apk --no-cache --purge add\
    php7\
    # nodeps, rdeps: baculum-api drupal7 nextcloud racktables zabbix-webif
    php7-bcmath\
    # deps: brotli-libs, nordeps
    #php7-brotli\
    # deps: libbz2, rdeps: phpmyadmin
    php7-bz2\
    # nodeps, nordeps
    php7-calendar\
    # nodeps, rdeps: baculum-commom bareos-webui drupal7 homer-api icingaweb2 nextcloud nextcloud19 php7-pecl-xhprof phpmyadmin phpmyadmin-doc zabbix-webif zoneminder
    php7-ctype\
    # deps: libcurl, rdeps: baculum-common composer drupal7 icingaweb2 icingaweb2-module-director nextcloud nextcloud19 php7-phalcon phpmyadmin phpmyadmin-doc rainloop-webmail zabbix-webif
    php7-curl\
    # nodeps, nordeps
    #php7-dbg\ # unused
    # deps: libxml2, rdeps: baculum-common drupal7 icingaweb2 nextcloud nextcloud20 php7-xmlreader php7-xsl rainloop-webmail
    php7-dom\
    # deps: enchant2, nordeps
    #php7-enchant\
    # deps: php7-mbstring, nordeps
    #php7-exif\ # unused
    # deps: libffi, nordeps
    #php7-ffi\ # unused
    #  nodeps, rdeps: nextcloud nextcloud19 php7-phalcon zabbix-webif
    php7-fileinfo\
    # deps: argon2-libs libedit libxml2 musl pcre2 php7-common zlib, rdeps: drupal7 nextcloud-initscript nextcloud19-initscript
    php7-fpm\
    # deps libssl libcrypto, nordeps
    php7-ftp\
    # deps: freetype libjpeg-turbo libpng libwebp libxpm musl php7-common zlib, rdeps: cacti-php7 drupal7 icingaweb2 nextcloud nextcloud19 phpmyadmin phpmyadmin-doc racktables zabbix-webif zoneminder
    php7-gd\
    # deps: libintl, rdeps: bareos-webui icingaweb2 php7-phalcon phpldapadmin zabbix-webif
    php7-gettext\
    # deps: gmp, rdeps: cacti-php7 drupal7 nextcloud nextcloud19
    php7-gmp\
    # nodeps, rdeps: composer drupal7 nextcloud nextcloud19 rainloop-webmail zabbix-webif
    php7-iconv\
    # deps: c-client, nordeps
    php7-imap\
    # deps: icu-libs rdeps: icingaweb2 nextcloud nextcloud19
    php7-intl\
    # nodeps, rdeps: baculum-common bareos-webui cacti-php7 composer drupal7 homer-api icingaweb2 nextcloud nextcloud19 php7-pecl-couchbase php7-pecl-mongodb php7-pecl-redis php7-phalcon phpmyadmin phpmyadmin-doc racktables rainloop-webmail zabbix-webif zoneminder 
    php7-json\
    # deps: libldap, rdeps: cacti-php7 homer-api-ldap icingaweb2 ltb-project-ssp nextcloud-user_ldap nextcloud19-user_ldap phpldapadmin
    php7-ldap\
    # deps: onguruma, rdeps: baculum-web bareos-webui cacti-php7 composer drupal7 nextcloud nextcloud19 php7-exif php7-pecl-mailparse php7-phalcon phpldapadmin phpmyadmin phpmyadmin-doc racktables zabbix-webif
    php7-mbstring\
    # deps: php7-mysqlnd php7-openssl, rdeps: phpmyadmin phpmyadmin-doc racktables
    php7-mysqli\
    # deps: php7-openssl, rdeps: baculum-api icingaweb2 php7-mysqli php7-pdo_mysql
    php7-mysqlnd\
    # deps: unixodbc, nordeps
    #php7-odbc\
    # nodeps, rdeps:  drupal7 phpldapadmin
    php7-opcache\
    # deps: libcrypto libssl, rdeps: bareos-webui cacti-php7 composer drupal7 icingaweb2 ltb-project-ssp nextcloud nextcloud-encryption nextcloud19 nextcloud19-encryption php7-mysqli php7-mysqlnd php7-phalcon phpldapadmin phpmyadmin phpmyadmin-doc rainloop-webmail zabbix-webif
    php7-openssl\
    # nodeps, rdeps: drupal7 icingaweb2-module-director nextcloud nextcloud19
    php7-pcntl\
    # nodeps, rdeps: baculum-api php7-pdo_dblib php7-pdo_mysql php7-pdo_odbc php7-pdo_pgsql php7-pdo_sqlite php7-phalcon
    php7-pdo\
    # nodeps, rdeps: baculum-api php7-pdo_dblib php7-pdo_mysql php7-pdo_odbc php7-pdo_pgsql php7-pdo_sqlite php7-phalcon
    php7-pdo_mysql\
    # deps: unixodbc, nordeps
    # php7-pdo_odbc\
    # deps: libpq, rdeps: icingaweb2 nextcloud-pgsql nextcloud19-pgsql
    php7-pdo_pgsql\
    # deps: sqlite-libs, rdeps: drupal7 icingaweb2 nextcloud-sqlite nextcloud19-sqlite rainloop-webmail
    php7-pdo_sqlite\
    # deps: libpq, rdeps: baculum-api icingaweb2 nextcloud-pgsql nextcloud19-pgsql
    php7-pgsql\
    # deps: php7, rdeps: composer
    php7-phar\
    # nodeps, rdeps: cacti-php7 nextcloud nextcloud19
    php7-posix\
    # nodeps, nordeps
    php7-pear\
    # deps: rabbitmq-c, nordeps
    #php7-pecl-amqp\
    # deps: libcouchbase php7-common php7-json php7-pecl-igbinary zlib, nordeps
    #php7-pecl-couchbase\
    # deps: ghostscript-fonts graphicsmagick, nordeps
    #php7-pecl-gmagick\
    # nodeps, nordeps
    #php7-pecl-lzf
    # deps: php7-session zlib, nordeps
    #php7-pecl-memcache
    # deps: libmemcached-libs php7-pecl-igbinary php7-session zlib
    #php7-pecl-memcached
    # nodeps, nordeps
    #php7-pecl-uploadprogress\
    # deps: libzmq, nordeps
    #php7-pecl-zmq\
    # deps: aspell-libs, nordeps
    # php7-pspell\
    # deps: imagemagick imagemagick-libs, rdeps: icingaweb2
    #php7-pecl-imagick\
    # nodeps, nordeps
    php7-pecl-xdebug\
    # deps: icu-libs libcrypto1.1 libsasl libssl1.1 musl php7-json snappy zlib, rdeps: mongo-php7-library
    #php7-pecl-mongodb\
    # deps: libevent, nordeps
    #php7-pecl-event\
    # deps: lz4-libs php7-pecl-igbinary, php7-json, php7-session, zstd-libs
    # php7-pecl-redis
    # nodeps, rdeps: zoneminder
    php7-pecl-apcu\
    # deps: libssh2, nordeps
    #php7-pecl-ssh2\
    # deps: libmaxminddb php7-bcmath, nordeps
    #php7-pecl-maxminddb\
    # nodeps, nordeps
    #php7-pecl-timezonedb\
    # deps: yaml, nordeps
    #php-pecl-yaml\
    # deps: libcurl, nordeps
    #php7-pecl-oauth\
    # deps: php7-mbstring, nordeps
    #php7-pecl-mailparse
    # nodeps, nordeps
    #php7-pecl-ast\
    # deps: libmcrypt, rdeps: nextcloud-encryption nextcloud19-encryption
    php7-pecl-mcrypt\
    # deps: php7-session php7-sockets, nordeps
    #php7-pecl-msgpack
    # deps: php7-ctype, rdeps: php7-pecl-xhprof-assets
    #php7-pecl-xhprof
    # deps: ghostscript-fonts graphviz php7-pecl-xhprof, nordeps
    #php7-pecl-xhprof-assets\
    # nodeps, nordeps
    #php7-pecl-protobuf\
    # deps: php7-curl php7-fileinfo php7-gettext php7-json php7-mbstring php7-openssl php7-pdo php7-pecl-psr php7-session
    #php7-phalcon\
    # deps libuuid, nordeps
    #php7-pecl-uuid\
    # deps: glib, vips, nordeps
    #php7-pecl-vips\
    # nodeps, rdeps: baculum-common bareos-webui cacti-php7 drupal7 homer-api icingaweb2 nextcloud nextcloud19 php7-pecl-memcache php7-pecl-memcached php7-pecl-msgpack php7-pecl-redis php7-phalcon phpldapadmin phpmyadmin phpmyadmin-doc zabbix-webif zoneminder
    php7-session\
    # nodeps, nordeps
    #php7-shmop\
    # deps: libxml2, rdeps: cacti-php7 drupal7 nextcloud nextcloud19 rainloop-webmail zabbix-webif
    php7-simplexml\
    # deps: sqlite-libs, rdeps:icingaweb2 nextcloud-sqlite nextcloud19-sqlite
    php7-sqlite3\
    # nodeps, nordeps
    #php7-sysvmsg\
    # nodeps, nordeps
    #php7-sysvshm
    # nodeps, nordeps
    #php7-sysvsem
    # deps: net-libs-snmp, rdeps: zoneminder?
    php7-snmp\
    # deps: libxml2, nordeps
    php7-soap\
    # nodeps, rdeps: cacti-php7 icingaweb2 php7-pecl-event php7-pecl-msgpack zabbix-webif zoneminder
    php7-sockets\
    # nodeps, nordeps
    #php7-tidy\
    # nodeps, rdeps: drupal7
    php7-tokenizer\
    # deps: libxml2, rdeps: baculum-common cacti-php7 drupal7 nextcloud nextcloud19 php7-pear php7-xmlrpc phpldapadmin
    php7-xml\
    # deps: libxml2 php7-dom, rdeps: nextcloud nextcloud19 zabbix-webif
    php7-xmlreader\
    # deps: php7-xml, nordeps
    php7-xmlrpc\
    # deps: libxml2, nordeps
    php7-xmlwriter\
    # deps: libxml2 libxslt, nordeps
    # php7-xsl
    # deps: libzip, deps: composer nextcloud nextcloud19 phpmyadmin phpmyadmin-doc
    php7-zip\
    fcgi &&\
    rm -rf /etc/init.d/* /etc/conf.d/* &&\
    # ensure php runs
    php7 --version

COPY --from=skilouise/init:latest /bin/* /bin/
COPY root /

STOPSIGNAL SIGQUIT

ENTRYPOINT ["/bin/init"]
CMD ["php-fpm7"]

HEALTHCHECK --interval=5s --timeout=5s\
    CMD SCRIPT_NAME=/ping SCRIPT_FILENAME=/ping REQUEST_METHOD=GET cgi-fcgi -bind -connect localhost:9000/ping | grep -q pong

EXPOSE 9000
