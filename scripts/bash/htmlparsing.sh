#!/bin/bash

#Script que baixa uma página web, busca por links e exibe os ips associados

if [ "$1" == "" ]
  then
    echo "JF SECURITY - HTML PARSING"
    echo "Modo de uso: $0 www.site.com"
  else
    echo ""
    echo -e "\e[1;33m####################################################"
    echo ""
    echo -e "\e[34m	Resolvendo URLs em:\e[32m $1 \e[33m"
    echo ""
    echo -e "####################################################\e[0m"
    echo ""

    wget -q $1 -O index.html

    cat index.html | sed 's#</#\n#g' | sed 's#><#\n#g'  | grep "href=\"http" | cut -d "/" -f3 | cut -d '"' -f1 | sort -u  > $1.hosts.txt

    cat $1.hosts.txt

    echo ""
    echo -e "\e[1;33m####################################################"
    echo -e "\e[34m	Concluído. Hosts armazenados em"
    echo -e "\e[32m	$1.hosts.txt  \e[33m"
    echo -e "####################################################\e[0m"
    echo ""

    for host in $(cat $1.hosts.txt); do
	host $host | grep "has address" 
    done;
fi
