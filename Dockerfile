FROM php:5.6-fpm

COPY opt/oracle /opt/oracle
COPY bin/* /usr/local/bin/
COPY Dockerfile.sh /usr/local/bin/re-php-Dockerfile.sh

ARG PHP_EXT_GROUP=ALL
ARG PHP_EXT=""
ARG PECL_EXT_GROUP=ALL
ARG PECL_EXT=""


ARG PHP_EXT_GROUP_ALL="\
bcmath \
bz2 \
calendar \
ctype \
curl \
fileinfo \
dom \
exif \
ftp \
gettext \
hash \
iconv \
intl \
json \
mbstring \
mcrypt \
mysqli \
opcache \
pdo \
pdo_mysql \
phar \
posix \
recode \
session \
simplexml \
snmp \
sockets \
tidy \
tokenizer \
xml \
xmlrpc \
xmlwriter \
xsl \
zip \
gd \
gmp \
imap \
ldap \
oci8 \
pdo_oci \
readline \
"
ARG PECL_EXT_GROUP_ALL="\
imagick \
"

RUN chmod +x /usr/local/bin/re-php-* \
 && chmod +x /usr/local/bin/re-pecl-* \
 && /usr/local/bin/re-php-Dockerfile.sh \
 && unlink /usr/local/bin/re-php-Dockerfile.sh
