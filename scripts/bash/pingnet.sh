#!/bin/bash

#Descobre os Hosts Ativos de uma Rede Classe C

if [ "$1" == "" ]; then
  echo "JF SECURITY - PING SWEEP"
  echo "Modo de uso: $0 Rede"
  echo "Exemplo: $0 192.168.0"
else
  echo "Iniciando Busca na rede:" $1
    for host in {1..254}; do
      ping -c 1 $1.$host | grep "64 bytes" | cut -d " " -f4 | sed 's/.$//'
    done
fi
