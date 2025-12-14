#!/bin/bash
trap exit SIGINT # Prevents infinite loops

if [ "$1" == "" ] # Usage example
then
	echo "PORT KNOCKER"
	echo "USAGE: $0 ADDRESS PORTS"
	echo "Ex: $0 192.168.0.1 80 22"
else
	ip=$1
	shift 1

	ports=$@
	for port in $ports; do
		nc -z $ip $port -v -w 1;
	done
fi
