FROM php:7.3.33-apache

# Instalar dependencias del sistema y extensiones PHP
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libicu-dev \
    libxml2-dev \
    libonig-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli zip mbstring intl xml \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copiar código de OJS
COPY . /var/www/html/

# Crear carpetas necesarias y permisos
RUN mkdir -p /var/www/html/files /var/www/html/cache /var/www/html/templates_c /var/www/html/public \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 777 /var/www/html/files \
    && chmod -R 777 /var/www/html/cache \
    && chmod -R 777 /var/www/html/templates_c \
    && chmod -R 777 /var/www/html/public

# Activar mod_rewrite
RUN a2enmod rewrite

# Variables de Apache
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# Redirigir tráfico de Render al puerto interno
CMD sed -i "s/Listen 80/Listen $PORT/" /etc/apache2/ports.conf && apache2-foreground


