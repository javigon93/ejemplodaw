#!/bin/bash

sudo rm -r ./dist/*
sudo cp -a ./src/web/* ./dist
sudo node-sass -o dist/css/ dist/scss/main.scss
sudo docker container stop apache_javier_gonzalez
sudo docker container rm apache_javier_gonzalez
sudo docker container stop mariadb_javier_gonzalez
sudo docker container rm mariadb_javier_gonzalez
sudo cp -a ./dist/* /opt/javier_gonzalez/docker/apache
sudo .//opt/javier_gonzalez/scripts/apache_javier.sh
sudo .//opt/javier_gonzalez/scripts/mariadb_javier.sh

