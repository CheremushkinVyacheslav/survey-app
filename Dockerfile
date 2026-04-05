FROM php:8.2-apache

# Устанавливаем системные библиотеки для PostgreSQL
RUN apt-get update && apt-get install -y libpq-dev && rm -rf /var/lib/apt/lists/*

# Компилируем расширения PHP
RUN docker-php-ext-install pdo pdo_mysql pdo_pgsql

# Копируем код в папку Apache
COPY . /var/www/html/
WORKDIR /var/www/html/

# Настраиваем порт 10000 (требование Render)
RUN sed -i "s/80/10000/g" /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf

# Права для Apache (исправлено: www-data, а не www-www-data)
RUN chown -R www-data:www-data /var/www/html/