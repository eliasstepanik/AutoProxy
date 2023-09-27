docker rmi $(docker images -a -q)
docker rm $(docker ps -a -f status=exited -q)
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker network prune
docker system prune -a
dpkg -l | grep -i dockersudo apt-get purge docker-ce docker-ce-cli containerd.io
sudo apt-get purge docker-ce docker-ce-cli containerd.io
sudo rm -rf /var/lib/docker /etc/docker
sudo groupdel docker
sudo rm -rf /var/run/docker.sock
sudo rm -rf /usr/local/bin/docker-compose
sudo rm -rf /etc/docker
sudo rm -rf ~/.docker
sudo groupdel docker
sudo apt-get autoremove

sh get-docker.sh
