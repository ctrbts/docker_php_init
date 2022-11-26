# Image Source
FROM php:7.4-fpm

ARG TIMEZONE

# Configuración por defecto para producción
COPY ./php.ini /usr/local/etc/php/conf.d/docker-php-config.ini

# Instalamos dependencias del sistema
RUN apt-get update && apt-get install -y git unzip \
    && pecl install \
        apcu \
        xdebug \
        redis \
    && docker-php-ext-enable \
        apcu \
        xdebug \
        redis

# Agregamos las extensiones para PHP | docker-php-ext-install para ver todas las disponibles
RUN docker-php-ext-install pdo pdo_mysql

# Agregamos el último composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Habilitamos opcache
RUN set -eux; \
docker-php-ext-enable opcache; \
{ \
echo 'opcache.memory_consumption=128'; \
echo 'opcache.interned_strings_buffer=8'; \
echo 'opcache.max_accelerated_files=4000'; \
echo 'opcache.revalidate_freq=2'; \
echo 'opcache.fast_shutdown=1'; \
} > /usr/local/etc/php/conf.d/opcache-recommended.ini

# Seteamos el timezone
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone
RUN printf '[PHP]\ndate.timezone = "%s"\n', ${TIMEZONE} > /usr/local/etc/php/conf.d/tzone.ini
RUN "date"

# Habilitamos la depuración PHP XDebug Extension
COPY ./xdebug.ini /tmp/xdebug.ini
RUN cat /tmp/xdebug.ini >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN rm /tmp/xdebug.ini

# Set working directory
WORKDIR /var/www