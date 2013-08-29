ansible-rethinkdb
=================

[Ansible](http://www.ansibleworks.com/) playbook for [RethinkDB](http://rethinkdb.com/). 

Supports single node and clustered configurations. Also has support for ssh tunneling between nodes in clustered configurations. Only tested on Centos 6 x86_64.

Usage Prereqs
================
You'll need to install [Ansible](http://www.ansibleworks.com/) on the machine you deploy from, for installation options see the [Ansible Docs](http://www.ansibleworks.com/docs/gettingstarted.html).

Create your own inventory file. Examples are included in the inventory_examples folder.

Usage
================
Quickstart
	ansible-playbook -i your_inventory_file rethinkdb.yml

Fireball
	ansible-playbook -i your_inventory_file rethinkdb_fireball.yml

TODO
=================
* Support rethinkdb proxy deployments
* Support other OS's

Configuration Options
=====================

Playbook Options
----------------
rethinkdb_cluster
	rethinkdb_cluster=true
Description: Will join all rethinkdb servers with eachother. It's a shortcut to typing out the indiviual joins=[] option for each server. See inventory_cluster_example file.
Usage: Use in global section
Default: false

rethinkdb_sshtunnel
	rethinkdb_sshtunnel=true
Description: Will use an ssh tunnel for all cluster communications. Installs and uses autossh for persistent connections. Generates keys for each server and distributes accordingly. Only tested with all rethinkdb_serve_hosts bound to 127.0.0.1. Requires each rethinkdb_serve_host to have a unique rethinkdb_cluster_port. See inventory_cluster_tunnel_example file.
Usage: Use in global section
Default: false

RethinkDB Options
-----------------
rethinkdb_runuser
	rethinkdb_runuser=someuser




