FROM phusion/baseimage:0.9.17

RUN apt-get update && apt-get upgrade -y && apt-get install -y build-essential curl nano

ENV TERM=xterm

RUN apt-get install -y apache2 php5 php5-gd php5-mysql php5-sqlite php-pear php5-curl php5-mcrypt

RUN a2enmod rewrite

RUN a2dismod cgi autoindex

RUN php5enmod mcrypt

ADD ./php.ini /etc/php5/apache2/php.ini

ADD ./000-default.conf /etc/apache2/sites-available/000-default.conf

RUN mkdir -p logs/apache2

RUN mkdir -p /etc/service/apache2

ADD ./run.sh /etc/service/apache2/run

RUN chmod +x /etc/service/apache2/run

ENV PROJECT_ROOT=/var/www/html

ENV WEB_ROOT=/

RUN rm /var/www/html/index.html

ADD ./index.php /var/www/html/index.php

ENV SSL_CERT=/etc/ssl/certs/ssl-cert-snakeoil.pem

ENV SSL_KEY=/etc/ssl/private/ssl-cert-snakeoil.key

RUN a2ensite default-ssl.conf

EXPOSE 80 443
