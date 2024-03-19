## Overview

This repository is a quick installer for prometheus lab with 3 main components:
1. prometheus server: run on port 9090
2. node_exporter: which will get and expose machine metrics on port 9100
3. python application: work as another prometheus target, run on port 8080

All these components are installed inside a virtual box, created by Vagrant.

## Prerequisites
Your computer should have theses tools:
- Vagrant
- VirtualBox

## How to run

> vagrant up

Check your vagrant log
![image](https://github.com/Bigguy98/vagrant-prometheus-server-setup/assets/27953500/130e5ebb-4493-4022-90d5-05a38a4d15bd)

Then access the prometheus website at http://localhost:9090
You'll see something like this:

![image](https://github.com/Bigguy98/vagrant-prometheus-server-setup/assets/27953500/64de58f3-d470-48ce-832a-dd817459282d)

Access Status --> Targets to view all targets configured on prometheus.yml file
![image](https://github.com/Bigguy98/vagrant-prometheus-server-setup/assets/27953500/f34c4d53-be9e-4e58-ba2d-c66ad581e14f)

