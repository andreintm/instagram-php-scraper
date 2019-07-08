FROM php:7.3.6-fpm

COPY composer.json /srv/app/

WORKDIR /srv/app

RUN apt-get update && apt-get install -y \
    build-essential \
    locales \
    zip \
    vim \
    curl

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "xdebug.idekey = PHPSTORM" >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini; \
    echo "xdebug.default_enable = 0" >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini; \
    echo "xdebug.remote_enable = 1" >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini; \
    echo "xdebug.remote_autostart = 0" >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini; \
    echo "xdebug.remote_connect_back = 0" >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini; \
    echo "xdebug.profiler_enable = 0" >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini; \
    echo "xdebug.remote_host = 10.254.254.254" >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . /srv/app

EXPOSE 9000

CMD ["php-fpm"]