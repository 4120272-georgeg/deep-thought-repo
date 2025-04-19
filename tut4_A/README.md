# Internal Network

For this task, our team setup a virtual box(vbox) internal network for each of the
virtual machines(vms) on our respective host system. Virtual machines 1 and 2 were given
a new vbox adapter, set to connect to the vbox internal network. When given proper
ip addresses, eg. 10.0.0.10 for vm1, it will allow vm1 to be seen and communicate with the
the other vms on the internal network.

Each individual sent a picture of them successfully:
 * connecting their vms to the vbox internal network,
 * giving each vm its own internal (private) ip address
 * pinging the other vm via its internal ip address to indicate that communication between
   them can take place.
