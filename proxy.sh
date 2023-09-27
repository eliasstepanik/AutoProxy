#!/bin/bash

help(){
        echo "rebuildPorts, rebuildDDNS, rebuildCaddy, rebuild, help"
}

rebuildPorts(){
        echo "rebuilding ..."
        docker compose down
	docker image rm -f f saile2204/portsync:latest
	docker build -t saile2204/portsync:latest ports/PortUpdate/
	docker compose up -d
}

rebuildDDNS(){
	echo "rebuilding ..."
        docker compose down
	docker image rm -f saile2204/ddns:latest
	docker build -t saile2204/ddns:latest ./ddns/IonosDynamicDNSUpdater/
	docker compose up -d

}

rebuildCaddy(){
	echo "rebuilding ..."
        docker compose down
	docker image rm -f saile2204/caddy-proxy:latest
	docker build -t saile2204/caddy-proxy:latest .
	docker compose up -d
}

rebuild(){
	echo "rebuilding ..."
	docker compose down
	docker image rm -f saile2204/caddy-proxy:latest
	docker image rm -f saile2204/ddns:latest
	docker image rm -f saile2204/portsync:latest
	docker build -t saile2204/portsync:latest ports/PortUpdate/
	docker build -t saile2204/ddns:latest ./ddns/IonosDynamicDNSUpdater/
	docker build -t saile2204/caddy-proxy:latest .
	docker compose up -d

}

fix(){
	echo "not done"
}

case $1 in
	rebuild) "$@"; exit;;
	rebuildCaddy) "$@"; exit;;
        rebuildDDNS) "$@"; exit;;
        rebuildPorts) "$@"; exit;;
        help) "$@"; exit;;
esac
