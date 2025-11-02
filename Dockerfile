# Base PHP + Apache
FROM php:7.4-apache

# Evitar warning de ServerName
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Instala dependencias necesarias para OJS
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
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli zip mbstring intl xml \
    && apt-get clean

# Copia todo el código de OJS al contenedor
COPY . /var/www/html/

# Crear carpetas críticas si no existen
RUN mkdir -p /var/www/html/files \
    /var/www/html/cache \
    /var/www/html/templates_c \
    /var/www/html/public

# Ajusta permisos de las carpetas críticas
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 777 /var/www/html/files \
    && chmod -R 777 /var/www/html/cache \
    && chmod -R 777 /var/www/html/templates_c \
    && chmod -R 777 /var/www/html/public

# Expone puerto de Apache
EXPOSE 80

# Arranca Apache en primer plano
CMD ["apache2-foreground"]
