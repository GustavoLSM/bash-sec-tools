#!/bin/bash
trap exit SIGINT # Prevents infinite loops

if [ "$1" == "" ] # Usage example
then
	echo "ZONE TRANSFER"
	echo "USAGE: $0 DOMAIN"
	echo "Ex: $0 server.example.com"
else
	for server in $(host -t ns $1 | cut -d " " -f 4); 
	do
		host -l -a $1 $server;
	done
fi