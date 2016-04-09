#!/bin/bash
#
# Setup the the box. This runs as root

# You can install anything you need here.
# Configure mysql
echo 'mysql-server mysql-server/root_password password root'       | debconf-set-selections
echo 'mysql-server mysql-server/root_password_again password root' | debconf-set-selections
