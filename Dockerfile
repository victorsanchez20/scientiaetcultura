# Dockerfile para OJS en Render con PHP 7.3.33

FROM php:7.3.33-apache

# 1️⃣ Actualizar y preparar dependencias necesarias
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

# 2️⃣ Copiar todo el código de OJS al contenedor
COPY . /var/www/html/

# 3️⃣ Crear carpetas necesarias y establecer permisos
RUN mkdir -p /var/www/html/files \
    /var/www/html/cache \
    /var/www/html/templates_c \
    /var/www/html/public \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 777 /var/www/html/files \
    && chmod -R 777 /var/www/html/cache \
    && chmod -R 777 /var/www/html/templates_c \
    && chmod -R 777 /var/www/html/public

# 4️⃣ Activar mod_rewrite de Apache
RUN a2enmod rewrite

# 5️⃣ Variables de entorno de Apache
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# 6️⃣ Redirigir tráfico de Render al Apache interno
CMD sed -i "s/Listen 80/Listen $PORT/" /etc/apache2/ports.conf && apache2-foreground
