FROM php:8.1.2-cli


WORKDIR /app

COPY . .

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN apt-get update && apt-get install -y \
    zip \
    unzip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer install

EXPOSE 8000


CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
