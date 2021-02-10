#!/bin/bash

rm -r ./dist/*
cp -a ./src/web/* ./dist
node-sass -o dist/css/ dist/scss/main.scss
sudo docker container stop apache_javier_gonzalez
sudo docker container rm apache_javier_gonzalez
sudo docker container stop mariadb_javier_gonzalez
sudo docker container rm mariadb_javier_gonzalez
cp -a ./dist/* /opt/javier_gonzalez/docker/apache
.//opt/javier_gonzalez/scripts/apache_javier.sh
.//opt/javier_gonzalez/scripts/mariadb_javier.sh

