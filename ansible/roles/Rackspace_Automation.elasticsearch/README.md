Elasticsearch
========

Deploys elasticsearch 0.90.x on Debian or Red Hat based distros (tested on CentOS and Ubuntu).

[![Build Status](https://drone-opsdev.rax.io/github.com/rack-roles/elasticsearch/status.svg?branch=master)](https://drone-opsdev.rax.io/github.com/rack-roles/elasticsearch)

Requirements
------------

Any pre-requisites that may not be covered by the ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

To Do
------------

- iptables work in this role does NOT play nice with other roles

Notes
------------

This role comes with a Vagrantfile and test playbook (test.yml). It can be tested using the Rackspace provider in the following manner:

```
# make ansible-playbook happy
$ mkdir roles; ln -s $(pwd) roles/elasticsearch

# setup vagrant
$ cp vagrant-rackspace.rc vagrant-rackspace.rc.local
# edit vagrant-rackspace.rc.local and Vagrantfile to your settings
$ . vagrant-rackspace.rc.local
$ vagrant up --provider=rackspace

# until Vagrant 1.5 fixes the groups in ansible
# so that more than one host can be in a group
$ buildinv_runplays.sh
```

License
-------

BSD

Author Information
------------------

Martin Smith <martin.smith@rackspace.com>
Mike Martin <mike.martin@rackspace.com>

[Rackspace - the open cloud company](http://rackspace.com)

Ask about our DevOps Automation Service - [www.rackspace.com/devops](http://rackspace.com/devops)
