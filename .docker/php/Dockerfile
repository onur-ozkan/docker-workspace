ARG VERSION

FROM php:${VERSION}

ARG EXTENSIONS
ARG MAIL
ARG HOST

ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions && sync

RUN install-php-extensions ${EXTENSIONS}

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get update && \
    apt-get install -y \
        git \
        openssh-server

RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keyscan ${HOST} > /root/.ssh/known_hosts

RUN ssh-keygen -N '' -C ${MAIL} -f /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa.pub