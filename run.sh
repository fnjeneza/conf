#!/bin/bash

cd /tmp
sudo apt update && sudo apt install ansible -y

ansible-playbook conf.yml -e ansible_python_interpreter=/usr/bin/python3 -K --become
