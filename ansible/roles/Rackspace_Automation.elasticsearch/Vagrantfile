# encoding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

boxes = [
{ :name => :es01, :role => 'elasticsearch', :ssh_port => 2201, :http_fwd => 9981 },
{ :name => :es02, :role => 'elasticsearch', :ssh_port => 2202, :http_fwd => 9982 },
{ :name => :es03, :role => 'elasticsearch', :ssh_port => 2203, :http_fwd => 9983 }
]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = 'dummy'
  config.vm.box_url = 'https://github.com/mitchellh/vagrant-rackspace/raw/master/dummy.box'

  config.ssh.private_key_path = ENV['RS_KEYPATH'] if ENV['RS_KEYPATH']

  config.vm.provider :rackspace do |rs|
    rs.username = ENV['OS_USERNAME'] if ENV['OS_USERNAME']
    rs.api_key  = ENV['OS_PASSWORD'] if ENV['OS_PASSWORD']

    if ENV['RS_FLAVOR']
      rs.flavor = ENV['RS_FLAVOR'] else rs.flavor = 'performance1-4'
    end
    if ENV['RS_IMAGE']
      rs.image = ENV['RS_IMAGE'] else rs.flavor = /Ubuntu 12.04/
    end

    rs.rackspace_region = ENV['RS_REGION'] if ENV['RS_REGION']

    rs.key_name = ENV['RS_KEYNAME'] if ENV['RS_KEYNAME']
    #rs.rackconnect = ENV['RS_RACKCONNECT'] if ENV['RS_RACKCONNECT']
    #rs.network '50b3c127-881f-43d2-901d-fc2d64874853'
  end

 # Name and build three servers
  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.host_name =   "%s.vagrant" % opts[:name].to_s
#      config.ssh.port = opts[:ssh_port]

      # CentOS requires, otherwise notty error
      config.ssh.pty = true
    end
  end

  # until vagrant 1.5, it will make a group with a single host for provisioning, so you can
  # never do loops through a host group (e.g. for a unicast host list for discovery), so take
  # the dynamic inventory files and make a big single one, and run:
  # $ ansible-playbook -i inventory-all elasticsearch.yml
  # to get a close approx: $  cat vagrant_ansible_inventory_es0* | sort | egrep -v "^$"
  
  config.vm.provision 'ansible' do |ansible|
    ansible.playbook = 'test.yml'
    ansible.host_key_checking = false
    ansible.groups = { "elasticsearch" => ["es01", "es02", "es03"]}
    ansible.verbose = "v"
  end

end
