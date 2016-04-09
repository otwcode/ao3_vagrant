#!/bin/bash
#
# Setup the the box. This runs as root

apt-get -y update

apt-get -y install curl

# You can install anything you need here.
# Configure mysql
echo 'mysql-server mysql-server/root_password password root'       | debconf-set-selections
echo 'mysql-server mysql-server/root_password_again password root' | debconf-set-selections
exit

# Install necessary dependencies
apt-get -y -q install  wget git tmux firefox xvfb vim atop

# required for downloads
apt-get install -y -q calibre 
# memcached
apt-get -y -q install  memcached
# mysql
apt-get -y -q install  mysql-server  libmysqlclient-dev  
/etc/init.d/mysql restart
# nginx
apt-get -y -q install nginx
# redis
apt-get install -y -q  redis-server 
# rvm
apt-get install -y -q  gawk libreadline6-dev zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev
# squid
apt-get install -y -q  squid3
