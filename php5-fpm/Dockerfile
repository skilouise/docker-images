FROM alpine:3.8

ENV USERID="7068"
ENV GROUPID="8080"
ENV WORKDIR="/var/www"

WORKDIR ${WORKDIR}

# Dependencies and reverse dependencies taken from https://pkgs.alpinelinux.org/packages
RUN set -eu; apk --no-cache --purge add\
    php5\
    # deps: freetds; nordeps
    php5-mssql\
    # nodeps, nordeps
    php5-bcmath\
    # deps: brotli-libs, nordeps
    #php7-brotli\
    # deps: libbz2, rdeps: phpmyadmin
    php5-bz2\
    # nodeps, nordeps
    php5-calendar\
    # nodeps, rdeps: baculum-commom bareos-webui drupal7 homer-api icingaweb2 nextcloud nextcloud19 php7-pecl-xhprof phpmyadmin phpmyadmin-doc zabbix-webif zoneminder
    php5-ctype\
    # deps: libcurl, rdeps: baculum-common composer drupal7 icingaweb2 icingaweb2-module-director nextcloud nextcloud19 php7-phalcon phpmyadmin phpmyadmin-doc rainloop-webmail zabbix-webif
    php5-curl\
    # nodeps, nordeps
    #php5-dbg\ # unused
    # deps: libxml2, rdeps: baculum-common drupal7 icingaweb2 nextcloud nextcloud20 php7-xmlreader php7-xsl rainloop-webmail
    php5-dom\
    # deps: enchant2, nordeps
    #php7-enchant\
    # deps: php7-mbstring, nordeps
    #php7-exif\ # unused
    # deps: libffi, nordeps
    #php5-ffi\ # unused
    # deps: argon2-libs libedit libxml2 musl pcre2 php7-common zlib, rdeps: drupal7 nextcloud-initscript nextcloud19-initscript
    php5-fpm\
    # deps libssl libcrypto, nordeps
    php5-ftp\
    # deps: freetype libjpeg-turbo libpng libwebp libxpm musl php7-common zlib, rdeps: cacti-php7 drupal7 icingaweb2 nextcloud nextcloud19 phpmyadmin phpmyadmin-doc racktables zabbix-webif zoneminder
    php5-gd\
    # deps: libintl, rdeps: bareos-webui icingaweb2 php7-phalcon phpldapadmin zabbix-webif
    php5-gettext\
    # deps: gmp, rdeps: cacti-php7 drupal7 nextcloud nextcloud19
    php5-gmp\
    # nodeps, rdeps: composer drupal7 nextcloud nextcloud19 rainloop-webmail zabbix-webif
    php5-iconv\
    # deps: c-client, nordeps
    php5-imap\
    # deps: icu-libs rdeps: icingaweb2 nextcloud nextcloud19
    php5-intl\
    # nodeps, rdeps: baculum-common bareos-webui cacti-php7 composer drupal7 homer-api icingaweb2 nextcloud nextcloud19 php7-pecl-couchbase php7-pecl-mongodb php7-pecl-redis php7-phalcon phpmyadmin phpmyadmin-doc racktables rainloop-webmail zabbix-webif zoneminder 
    php5-json\
    # deps: libldap, rdeps: cacti-php7 homer-api-ldap icingaweb2 ltb-project-ssp nextcloud-user_ldap nextcloud19-user_ldap phpldapadmin
    php5-ldap\
    # deps: php7-mysqlnd php7-openssl, rdeps: phpmyadmin phpmyadmin-doc racktables
    php5-mysqli\
    # nodeps, nordeps
    php7-opcache\
    # deps: libcrypto libssl, rdeps: bareos-webui cacti-php7 composer drupal7 icingaweb2 ltb-project-ssp nextcloud nextcloud-encryption nextcloud19 nextcloud19-encryption php7-mysqli php7-mysqlnd php7-phalcon phpldapadmin phpmyadmin phpmyadmin-doc rainloop-webmail zabbix-webif
    php5-openssl\
    # nodeps, rdeps: drupal7 icingaweb2-module-director nextcloud nextcloud19
    php5-pcntl\
    # nodeps, rdeps: baculum-api php7-pdo_dblib php7-pdo_mysql php7-pdo_odbc php7-pdo_pgsql php7-pdo_sqlite php7-phalcon
    php5-pdo\
    # nodeps, rdeps: baculum-api php7-pdo_dblib php7-pdo_mysql php7-pdo_odbc php7-pdo_pgsql php7-pdo_sqlite php7-phalcon
    php5-pdo_mysql\
    # deps: libpq, rdeps: icingaweb2 nextcloud-pgsql nextcloud19-pgsql
    php5-pdo_pgsql\
    # deps: sqlite-libs, rdeps: drupal7 icingaweb2 nextcloud-sqlite nextcloud19-sqlite rainloop-webmail
    php5-pdo_sqlite\
    # deps: libpq, rdeps: baculum-api icingaweb2 nextcloud-pgsql nextcloud19-pgsql
    php5-pgsql\
    # deps: php7, rdeps: composer
    php5-phar\
    # nodeps, rdeps: cacti-php7 nextcloud nextcloud19
    php5-posix\
    # nodeps, nordeps
    php5-pear\
    # deps: libmcrypt, rdeps: nextcloud-encryption nextcloud19-encryption
    php5-mcrypt\
    # deps: sqlite-libs, rdeps:icingaweb2 nextcloud-sqlite nextcloud19-sqlite
    php5-sqlite3\
    # deps: net-libs-snmp, rdeps: zoneminder?
    php5-snmp\
    # deps: libxml2, nordeps
    php5-soap\
    # nodeps, rdeps: cacti-php7 icingaweb2 php7-pecl-event php7-pecl-msgpack zabbix-webif zoneminder
    php5-sockets\
    # deps: libxml2, rdeps: baculum-common cacti-php7 drupal7 nextcloud nextcloud19 php7-pear php7-xmlrpc phpldapadmin
    php5-xml\
    # deps: libxml2 php7-dom, rdeps: nextcloud nextcloud19 zabbix-webif
    php5-xmlreader\
    # deps: php7-xml, nordeps
    php5-xmlrpc\
    # deps: libzip, deps: composer nextcloud nextcloud19 phpmyadmin phpmyadmin-doc
    php5-zip\
    fcgi &&\
    rm -rf /etc/init.d/* /etc/conf.d/* &&\
    # ensure php runs
    php5 --version

COPY --from=skilouise/init:latest /bin/* /bin/
COPY root /

STOPSIGNAL SIGQUIT

ENTRYPOINT ["/bin/init"]
CMD ["php-fpm5"]

HEALTHCHECK --interval=5s --timeout=5s\
    CMD SCRIPT_NAME=/ping SCRIPT_FILENAME=/ping REQUEST_METHOD=GET cgi-fcgi -bind -connect localhost:9000/ping | grep -q pong

EXPOSE 9000
