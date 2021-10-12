FROM php:7.3-fpm
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
COPY ioncube_loader_lin_7.3.so /usr/local/lib/php/extensions/no-debug-non-zts-20180731/ioncube_loader_lin_7.3.so 
COPY ixed.7.3.lin /usr/local/lib/php/extensions/no-debug-non-zts-20180731/ixed.7.3.lin
COPY 01-extensions.conf /usr/local/etc/php/conf.d/01-extensions.ini
RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions json pdo pdo-mysql zip gd mbstring curl xml bcmath soap intl
RUN docker-php-ext-install mysqli pdo pdo_mysql opcache
