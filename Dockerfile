#FROM php:5.6-apache

#USER root

FROM httpd

RUN apt-get update 
RUN apt-get -y install apache2 apache2-dev flex bison libxml2-dev libcurl4-openssl-dev libjpeg-dev libpng-dev libxpm-dev libpq-dev libicu-dev libfreetype6-dev libldap2-dev libxslt-dev libldb-dev curl
RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/libldap.so && ln -s /usr/lib/x86_64-linux-gnu/liblber.so /usr/lib/liblber.so
RUN apt-get install build-essential


RUN mkdir -p /usr/local/src/ 
ADD http://de2.php.net/get/php-5.6.36.tar.bz2/from/this/mirror /usr/local/src/php-5.6.36.tar.bz2
RUN cd /usr/local/src/ && tar xjf php-5.6.36.tar.bz2 
WORKDIR /usr/local/src/php-5.6.36
RUN ./configure \
  --enable-mbstring \
  --with-curl \
  --enable-zip \
  --with-gd \
  --with-jpeg-dir \
  --with-png-dir \
  --with-pgsql \
  --with-freetype-dir \
  --enable-intl \
  --with-xsl \
  --with-zlib 
RUN make && make install

 
