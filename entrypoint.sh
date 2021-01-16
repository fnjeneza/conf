#!/bin/bash

NEW_USER=$1
if [ -z $NEW_USER ]; then
  echo "Username shall be provided"
  exit
fi
ENV_DIR=`mktemp -d`
INVENTORY=$ENV_DIR/inventory

apt update && apt install -y git python3-venv
python3 -m venv $ENV_DIR
source $ENV_DIR/bin/activate
pip install ansible
echo "localhost ansible_host=localhost ansible_connection=local ansible_python_interpreter=/usr/bin/python3" > $INVENTORY
ansible-pull conf.yml --inventory localhost,$INVENTORY --url https://github.com/fnjeneza/conf.git --extra-vars "username=$NEW_USER"
