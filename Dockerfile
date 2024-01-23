FROM php:8.1.2-cli


WORKDIR /app


COPY . .


EXPOSE 8000


CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
