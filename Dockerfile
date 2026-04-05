FROM php:8.2-apache

# Устанавливаем расширения для работы с БД
RUN docker-php-ext-install pdo pdo_mysql pdo_pgsql

# Копируем код в папку Apache
COPY . /var/www/html/
WORKDIR /var/www/html/

# Render требует, чтобы приложение слушало порт 10000
EXPOSE 10000
ENV PORT=10000
RUN sed -i "s/80/$PORT/g" /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf

# Права для Apache
RUN chown -R www-data:www-data /var/www/html/