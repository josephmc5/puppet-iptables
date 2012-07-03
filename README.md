puppet-iptables
===============

Installs iptables init script and config files from a template. This method
keeps you from being locked into creating firewall rules through puppet.

Site.pp
--------------
For each host you will need to define $role and the ip address of any hosts you
include in the template.

Templates
------------- 
Templates generate three files which are loaded in sequence based
on the number preceeding them. In 50local.erb there are several "roles" where
you can define specific rules for those roles.

###Jump Server###
If you connect to virtual servers through a jump server you can define the host
and a rule will be added. This is a good example of having a rule only if a
variable is defined.
