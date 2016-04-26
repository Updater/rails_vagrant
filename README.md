# Vagrant 
This is how we run & manage our local development environment. It runs in a VirtualBox virtual machine and Vagrant is a software like Chef but for managing it.

## Prereqs
* install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) 
* install [Vagrant](http://www.vagrantup.com/downloads.html)
* read the [Vagrant documentation](http://docs.vagrantup.com/v2/)


## Setup
1. Create a Web directory on your desktop `~/Desktop/Web`
2. Clone the following reps into the "Web" directory
3. Clone `git@github.com:Updater/rails_vagrant.git`
4. On the command line run the following from "Web/rails_vagrant"

```bash
vagrant up
```
This bootstraps a vagrant box and configures it using the `vagrant` chef role.

## Web Directory
We'll mount the "~/Desktop/Web" Host directory to "/var/www" on the dev box. All apps will run from this directory. So clone or move all your repos to this directory


### IP address
The box is on a local virtual network with IP `192.168.33.10`

### Port forwarding
Vagrant forwards the following ports on the host to the dev box

1. 8080 to 80
2. 8443 to 443
3. 2222 to 22


### SSH to vagrant box
You can use vagrant to ssh into the box
```bash
vagrant ssh
```
You can also SSH to it directly using the private key found in the vagrant repo directory `.vagrant/machines/default/virtualbox/private_key`

Mac Example:

`/Users/{USER}/Desktop/Web/vagrant/.vagrant/machines/default/virtualbox/private_key`

1. On localhost using port 2222 (since 2222 is forwarded to 22)
2. The IP of the box on the local network `192.168.33.10`


### Starting
To start a your local machine after it's been shutdown:

```bash
vagrant up
```
@windows Be sure to shutdown Pageant (upstream bug for net-ssh module https://github.com/net-ssh/net-ssh/issues/92)

### Updating
To update the vagrant box
1. Run `vagrant provision` on the host machine in `rails_vagrant` folder.

### Destroying a box
```bash
vagrant destroy
```


### Troubleshooting

If you see the following error:
```
Progress state: NS_ERROR_FAILURE
VBoxManage: error: Failed to create the host-only adapter
VBoxManage: error: VBoxNetAdpCtl: Error while adding new interface: failed to open /dev/vboxnetctl: No such file or directory
VBoxManage: error: Details: code NS_ERROR_FAILURE (0x80004005), component HostNetworkInterface, interface IHostNetworkInterface
VBoxManage: error: Context: "int handleCreate(HandlerArg*, int, int*)" at line 66 of file VBoxManageHostonly.cpp
```
Run `sudo launchctl load /Library/LaunchDaemons/org.virtualbox.startup.plist` in your local machine

### Other Notes

1. Each box uses the same Node & Client

