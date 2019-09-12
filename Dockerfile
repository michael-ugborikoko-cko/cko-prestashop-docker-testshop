FROM prestashop/prestashop
#Install git
RUN apt-get update \
    && apt-get install -y git
#Install nano
RUN apt-get install nano -y
#Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=. --filename=composer
RUN mv composer /usr/local/bin/
COPY apache2/sites-available/ /etc/apache2/sites-available/
RUN a2ensite prestashop.conf
EXPOSE 80
