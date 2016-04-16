#!/bin/bash

# This is required until the ansible provisioner for Vagrant
# becomes aware of groups. Right now, for each VM, it runs it
# in a group 'elasticsearch' of one host. This means all the 
# cluster aware stuff in the playbook doesn't work.

# This script takes the individual inventory files from Vagrant
# and builds one big one, and then runs the test playbook 
# with the elasticsearch role against that big inventory.

rm inventory-all
for f in $(ls vagrant_ansible_inventory_es*); do 
  grep = $f >> inventory-all; 
done; 
echo "[elasticsearch]" >> inventory-all 

for f in $(ls vagrant_ansible_inventory_es*); do 
  grep = $f | sed 's/ .*//g' >> inventory-all; 
done; 

ansible-playbook -i inventory-all test.yml
