# vagrant-docker-node

Boilerplate for Node.js (with Express.js and nodemon) in Vagrant w/ Docker. For now a simple Hello World using MongoDB.

To install:

Install the latest version of [Vagrant](https://www.vagrantup.com/)  
Install the latest version of [VirtualBox](https://www.virtualbox.org/)

In the main directory, type `sh start.sh`. The following will occur:

Dependencies will be installed if they aren't already  
The host VM will be created and booted up  
Docker will be installed on the host VM  
docker-compose will build the docker container for the web service and MongoDB 
gatling-rsync-auto will start

Navigate to or curl localhost:8080 to test if everything worked correctly. You should see "Hello World!". If you get an
error like "Could not connect to MongoDB" instead, try running `vagrant reload` in your main directory, then 
`vagrant gatling-rsync-auto` to restart syncing.

If everything works, you can test autosyncing by changing `server.js` (on your machine), 
then refreshing the page to see your changes.