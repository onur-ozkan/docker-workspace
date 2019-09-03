ARG VERSION

FROM debian:${VERSION}

ARG _PACKAGES
ARG PACKAGES_

ARG ENABLE_PHP
ARG PHP

RUN apt-get update && apt-get install -y ${_PACKAGES}

RUN if [ "$ENABLE_PHP" = "TRUE" ]; then \
        apt-get -y install apt-transport-https lsb-release ca-certificates && \
        wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
        sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' && \
        apt-get update && apt-get install -y ${PHP} && \
        curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
        mkdir -p /run/php; \
    fi

RUN apt-get install -y ${PACKAGES_}