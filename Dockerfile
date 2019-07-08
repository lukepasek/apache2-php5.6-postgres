FROM apache2-php5.6-postgres:latest

COPY php.ini /usr/local/php5.6.36/lib/
COPY php.conf /usr/local/apache2/conf/conf.d/

RUN \
  echo "Include conf/conf.d/*.conf" >> /usr/local/apache2/conf/httpd.conf \
  echo "AddDefaultCharset utf-8" >> /usr/local/apache2/conf/httpd.conf

CMD [ "httpd-foreground" ]
