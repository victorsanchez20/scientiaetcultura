# Imagen base con PHP y Apache
FROM php:7.4-apache

# Instala extensiones necesarias para OJS
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    unzip \
    libicu-dev \
    libxml2-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli zip mbstring intl xml

# Copia los archivos del proyecto a la carpeta del servidor web
COPY . /var/www/html/

# Ajusta permisos (OJS necesita escritura en ciertas carpetas)
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expone el puerto 8080
EXPOSE 8080

# Inicia Apache
CMD ["apache2-foreground"]
