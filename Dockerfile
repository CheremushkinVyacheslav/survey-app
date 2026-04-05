FROM php:8.2-apache

# Устанавливаем системные библиотеки для PostgreSQL
RUN apt-get update && apt-get install -y libpq-dev && rm -rf /var/lib/apt/lists/*

# Компилируем расширения PHP
RUN docker-php-ext-install pdo pdo_mysql pdo_pgsql

# Копируем код в папку Apache
COPY . /var/www/html/
WORKDIR /var/www/html/

# Render требует порт 10000
EXPOSE 10000
ENV PORT=10000
RUN sed -i "s/80/$PORT/g" /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf

# Права для Apache
RUN chown -R www-www-data /var/www/html/