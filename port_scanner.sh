#!/bin/bash
trap exit SIGINT # Prevents infinite loops

if [ "$1" == "" ] # Usage example
then
	echo "PORT SCANNER"
	echo "USAGE: $0 NETWORK PORT"
	echo "Ex: $0 192.168.0 80"
else
	for i in {1..254}; 
	do
		ip=$1.$i;
		timeout 1 bash -c "echo > /dev/tcp/$ip/$2" 2> /dev/null;

		if [ $? -eq 0 ]
		then
			echo "Port $2 on $ip is open"
		fi
	done
fi
