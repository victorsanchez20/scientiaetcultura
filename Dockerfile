# Dockerfile para OJS en Render

# 1️⃣ Imagen base PHP con Apache
FROM php:7.4-apache

# 2️⃣ Instalar extensiones necesarias para OJS
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    unzip \
    libicu-dev \
    libxml2-dev \
    libonig-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli zip mbstring intl xml

# 3️⃣ Copiar todo el código de OJS al contenedor
COPY . /var/www/html/

# 4️⃣ Crear carpetas necesarias y establecer permisos
RUN mkdir -p /var/www/html/files \
    /var/www/html/cache \
    /var/www/html/templates_c \
    /var/www/html/public \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 777 /var/www/html/files \
    && chmod -R 777 /var/www/html/cache \
    && chmod -R 777 /var/www/html/templates_c \
    && chmod -R 777 /var/www/html/public

# 5️⃣ Activar mod_rewrite de Apache
RUN a2enmod rewrite

# 6️⃣ Configurar Apache para usar variable de Render PORT
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# Redirigir tráfico de puerto dinámico de Render al Apache interno
CMD sed -i "s/Listen 80/Listen $PORT/" /etc/apache2/ports.conf && apache2-foreground

