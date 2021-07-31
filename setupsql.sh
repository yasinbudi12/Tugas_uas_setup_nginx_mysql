#!/bin/bash

sudo apt update
sudo apt install mysql-server -y

ROOT_SQL_PASS=foo123
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $ROOT_SQL_PASS"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $ROOT_SQL_PASS"
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server


export DBPASS=1234567890

# MEMBUAT USER DI MYSQL
echo "Masukkan Password Root MYSQL"
sudo mysql -u root -p   <<CREATE_USER_QUERY
create user 'tugas'@'localhost' identified by '1234567890';
grant all privileges on *.* to 'tugas'@'localhost';
CREATE_USER_QUERY
echo "Membuat User tugas di MySQL berhasil" 

# MEMBUAT DATABASE
echo "Masuk sebagai user tugas di MySQL"
sudo mysql -u tugas -p$DBPASS     <<CREATE_DB_QUERY
create database dbuas;
