# vagrant-docker-node

Boilerplate for Node.js (with Express.js and nodemon) in Vagrant w/ Docker. For now a simple Hello World. More to come, 
including MongoDB.

To install:

Install the latest version of [Vagrant](https://www.vagrantup.com/)
Install the latest version of [VirtualBox](https://www.virtualbox.org/)

In the main directory, type `sh start.sh`. The following will occur:

Dependencies will be installed if they aren't already
The host VM will be created and booted up
Docker will be installed on the host VM
docker-compose will build the docker container for the web service
gatling-rsync-auto will start

Note that if this process gives an error and cancels at some point, typing `sh start.sh` again may fix it.

Navigate to or curl localhost:8080 to test if everything worked correctly. You should see "Hello World!".
To test autosyncing, try changing the message in `server.js` (on your machine), then refresh the page to see your changes.