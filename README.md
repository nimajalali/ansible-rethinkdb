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

```ansible-playbook -i your_inventory_file rethinkdb.yml```

TODO
=================
* Convert help file to wiki page in github
* Support rethinkdb proxy deployments
* Support other OS's




