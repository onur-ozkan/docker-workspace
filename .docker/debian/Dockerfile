ARG VERSION
FROM debian:${VERSION}

ARG _PACKAGES
ARG PACKAGES_

ARG ENABLE_PHP
ARG PHP

ARG ENABLE_YARN
ARG ENABLE_NODEJS

ARG EX_BASH
ARG CUSTOM_BASH

RUN apt-get update && apt-get install -y \
    openssh-server \
    ${_PACKAGES}   \
            wget   \
            sudo   \
            curl   \
            git

RUN if [ "$ENABLE_PHP" = "TRUE" ]; then \
        apt-get install -y apt-transport-https lsb-release ca-certificates && \
        wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
        sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' && \
        apt-get update && apt-get install -y ${PHP} && \
        curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
        mkdir -p /run/php; \
    fi

RUN if [ "$ENABLE_NODEJS" = "TRUE" ]; then \
        curl -sL https://deb.nodesource.com/setup_10.x | sudo bash - && \
        apt-get update && apt-get install -y nodejs && \
        curl -o- -L https://yarnpkg.com/install.sh | bash && \
        mkdir -p /run/php; \
    fi

RUN if [ ! -z "$PACKAGES_" ]; then \
      apt-get install -y ${PACKAGES_}; \
    fi

RUN if [ "$EX_BASH" = "TRUE" ]; then \
      sh -c "$CUSTOM_BASH"; \
    fi