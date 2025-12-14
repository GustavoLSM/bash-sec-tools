#!/bin/bash
trap exit SIGINT # Prevents infinite loops

if [ "$1" == "" ] # Usage example
then
	echo "HTML PARSER"
	echo "USAGE: $0 URL"
	echo "Ex: $0 www.example.com"
else
	echo "[+] SEARCHING SUBDOMAINS ON $1"

	wget -q $1

	echo -e "\n"

	grep href index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" > list

	rm -rf index.html

	echo "[+] SUBDOMAINS FOUND:"
	for url in $(cat list); do
		host $url | grep "has address";
	done

	rm -rf list
fi
