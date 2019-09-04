#!/bin/sh

PHP_VER=$(php -v | head -n 1 | cut -d " " -f 2 | cut -f1-2 -d".")

if [ $PHP_VER ]; then
        php-fpm$PHP_VER -F -R
fi