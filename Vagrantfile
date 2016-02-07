# -*- mode: ruby -*-
# vi: set ft=ruby :

# Create and configure the host VM
Vagrant.configure("2") do |config|

  # Assign a name to the host VM
  config.vm.hostname = "docker-host"
  
  # Set up the synced folder on the host VM
  config.vm.synced_folder ".", "/sync", type: "rsync",
    rsync__exclude: [".git/", "node_modules/", ".idea/"]

  # Specify the VirtualBox box
  config.vm.box = "ubuntu/trusty64"
  
  # Provision the host with docker and docker-compose
  config.vm.provision :docker
  config.vm.provision :docker_compose,
  	yml: "/sync/docker-compose.yml",
  	rebuild: true,
  	run: "always"
  	
  # Run rsync manually after setup
  config.gatling.rsync_on_startup = false
  
  # Forward ports so that we can access localhost on our machien
  config.vm.network :forwarded_port, guest: 8080, host: 8080
end