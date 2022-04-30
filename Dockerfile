FROM ubuntu:20.04

LABEL maintainer="jvincent.camacho@gmail.com"

#Turns off the questions normally asked for location and timezone for Apache
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  curl \
  vim \
  git \
  apache2

WORKDIR /var/www/html/

COPY codigo-html/ .

CMD ["apachectl", "-D", "FOREGROUND"]