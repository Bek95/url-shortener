# Utilisation d'une image PHP avec Nginx et Composer
FROM php:8.2-fpm

# Installation des dépendances requises
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libmcrypt-dev \
    zip \
    git \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql opcache

# Installation de Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Installation de Redis
RUN pecl install redis && docker-php-ext-enable redis

# Définir le répertoire de travail
WORKDIR /var/www

# Copier le code source de l'application Laravel
COPY . .

# Installer les dépendances de Composer
RUN composer install

# Exposer le port
EXPOSE 9000

# Lancer PHP-FPM
CMD ["php-fpm"]
