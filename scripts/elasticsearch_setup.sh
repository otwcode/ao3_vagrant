#!/bin/bash
exit 0

echo Install elasticsearch
cd /tmp
if [ `uname -i` = "x86_64" ] ; then
  wget –quiet http://media.transformativeworks.org/ao3/new_vagrant/jdk-7u67-linux-x64.tar.gz > /dev/null
  mkdir -p /usr/otw
  cd /usr/otw
  tar xf /tmp/jdk-7u67-linux-x64.tar.gz
else
  wget –quiet  http://media.transformativeworks.org/ao3/new_vagrant/jdk-7u67-linux-i586.tar.gz > /dev/null
  mkdir -p /usr/otw
  cd /usr/otw
  tar xf /tmp/jdk-7u67-linux-i586.tar.gz
fi
export JAVA_HOME=/usr/otw/jdk1.7.0_67 
cd /tmp
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.12.deb
dpkg --install elasticsearch-0.90.12.deb 
echo "JAVA_HOME=/usr/otw/jdk1.7.0_67" >> /etc/default/elasticsearch 
