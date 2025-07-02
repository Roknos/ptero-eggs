FROM alpine:3.18

RUN apk --update --no-cache add curl ca-certificates nginx
RUN apk add --no-cache \
  php82 php82-fpm php82-mbstring php82-curl php82-json \
  php82-pdo php82-pdo_mysql php82-iconv php82-openssl \
  php82-tokenizer php82-simplexml php82-fileinfo \
  php82-exif php82-xml php82-bcmath php82-gd php82-ctype


COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh


CMD ["/bin/ash", "/entrypoint.sh"]
