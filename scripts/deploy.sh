#!/bin/bash

sudo rm -r ./dist/*
sudo cp -a ./src/web/* ./dist
sudo npm install
sudo node-sass -o /css /scss/main.scss
sudo docker container stop apache_javier_gonzalez
sudo docker container rm apache_javier_gonzalez
sudo docker container stop mariadb_javier_gonzalez
sudo docker container rm mariadb_javier_gonzalez
sudo rm -r /opt/javier_gonzalez/docker/apache/*
sudo cp -a ./dist/* /opt/javier_gonzalez/docker/apache
sudo bash /opt/javier_gonzalez/scripts/apache_javier.sh
sudo bash /opt/javier_gonzalez/scripts/mariadb_javier.sh
sudo docker container exec -it apache_javier_gonzalez docker-php-ext-install pdo pdo_mysql
sudo docker container exec -it apache_javier_gonzalez a2enmod rewrite
sudo docker container restart apache_javier_gonzalez
cd ..
sudo rm -r ejemplodaw/
sudo mkdir ejemplodaw
sudo chmod 777 ejemplodaw/
