FROM alexcheng/magento
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y apt-utils vim supervisor sendmail php5-gd php5-mysql libpng12-dev libmcrypt-dev libreadline-dev
RUN mkdir -p /usr/local/etc/php/conf.d/ && docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mcrypt gd soap && service apache2 restart
RUN sendmailconfig
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY host_set.sh /host_set.sh
CMD ["/usr/bin/supervisord"]
