ansible-rethinkdb
=================

[Ansible](http://www.ansibleworks.com/) playbook for [RethinkDB](http://rethinkdb.com/). 

Supports single node and clustered configurations. Also has support for ssh tunneling, using autossh, between nodes. Works with 32-bit and 64-bit CentOS 6.

Usage Prereqs
================
1. You'll need to install [Ansible](http://www.ansibleworks.com/) on the machine you deploy from, for installation options see the [Ansible Docs](http://www.ansibleworks.com/docs/gettingstarted.html).

2. Create your own inventory file. Examples are included in the inventory_examples folder. If you don't want to use ```cluster=true```, which joins all rethinkdb_serve_hosts with eachother, you can setup host_vars for each host stating the rethinkdb_joins manually. I've included an example file in the host_vars directory. See help file for more configuration info.

Usage
================

```ansible-playbook -i your_inventory_file rethinkdb.yml```

TODO
=================
* Convert help file to wiki page on github
* Support rethinkdb proxy deployments
* Support Ubuntu
* Add option to install nginx and setup a password protected proxy for rethinkdb's web interface
