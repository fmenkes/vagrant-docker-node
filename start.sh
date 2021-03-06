#!/bin/bash
# With thanks to hharnisc for the startup script

# make sure vagrant is installed
if ! type vagrant > /dev/null; then
  echo "Need to install vagrant - https://docs.vagrantup.com/v2/installation/"
  exit -1
fi

# make sure the vagrant-gatling-rsync plugin is installed
if ! vagrant plugin list | grep -q 'vagrant-gatling-rsync'; then
  echo "Could not find vagrant-gatling-rsync plugin "
  read -r -p "Install vagrant-gatling-rsync plugin? [y/N] " response
  case $response in
      [yY][eE][sS]|[yY])
          vagrant plugin install vagrant-gatling-rsync
          ;;
      *)
          echo "Need vagrant-gatling-rsync to continue, exiting "
          exit -1
          ;;
  esac
fi

# make sure vagrant-docker-compose pluggin is installed
if ! vagrant plugin list | grep -q 'vagrant-docker-compose'; then
  echo "Could not find vagrant-docker-compose plugin "
  read -r -p "Install vagrant-docker-compose plugin? [y/N] " response
  case $response in
      [yY][eE][sS]|[yY])
          vagrant plugin install vagrant-docker-compose
          ;;
      *)
          echo "Need vagrant-docker-compose to continue, exiting "
          exit -1
          ;;
  esac
fi


vagrant up
echo "Starting watch..."
vagrant gatling-rsync-auto