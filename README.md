# Vagrant Node Red with Freeboard on Ubuntu 16.04 box

This is a [Vagrant](http://vagrantup.com/)/[Ansible](http://www.ansible.com/) setup for running [node red](http://nodered.org/) in conjunction with the [freeboard](http://freeboard.io/) dashboard.

Inspired by this [Gist](https://gist.github.com/dceejay/fb47301b759222e05f84).

## Installation / Usage

Install virtualbox

    wget https://www.virtualbox.org/download/oracle_vbox_2016.asc
    sudo apt-key add -y oracle_vbox_2016.asc
    #ubuntu 16.04/LM 18
    sudo echo " deb http://download.virtualbox.org/virtualbox/debian xenial contrib" | sudo tee -a /etc/apt/sources.list    
    sudo apt-get update
    sudo apt-get install dkms virtualbox-5.1

Install Vagrant

    wget https://releases.hashicorp.com/vagrant/1.9.3/vagrant_1.9.3_x86_64.deb
    sudo dpkg -i vagrant*.deb


Install Ansible and git on your platform.

        sudo apt install ansible  git


Test ansible playbook syntax

    ansible-playbook ./provisioning/playbook.yml --syntax-check


bootstrap.sh is to install python or other required packages if not installed in vm boc


Run

    vagrant up


run vagrant after error


    vagrant reload --provision

manual install check vm log

    vagrant ssh


Point your browser to [freeboard dashboard](http://localhost:1880/) to see the plain dashboard, to [freeboard websocket demo](http://localhost:1880/?load=demo_websocket_counter.json) to see the websocket counter demo and to [Node Red](http://localhost:1880/admin/) to access the Node Red configuration interface.

Uses upstart to start node red application.

Modify the vars http_port, install_path and run_as in the ansible playbook, if you want to use the playbook for installation on a non-vagrant machine.

## Installation on Beaglebone Black

The Ansible playbook can be used to install Node Red / Freeboard on a [Beaglebone Black](http://beagleboard.org/). Comment the variables for the Vagrant setup and uncomment the BBB settings. Hook up your BBB via USB as described in the [Getting Started](http://beagleboard.org/getting-started) Section of the BBB website.

Append your ssh pubkey to the .ssh/authorized_keys file of the debian user on the BBB and test the login.

Create an inventory file with only the IP address 192.168.7.2 in it.

Run

    ansible-playbook -i ../inventory provisioning/playbook.yml

This takes a while. If everything went ok Node Red should be available [here](http://192.168.7.2:1880/admin/). This setup was tested with a BBB that had already been in use. If you run into any problems please leave a description in the issues.
