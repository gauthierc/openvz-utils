#!/bin/bash
# Retourne une erreur lorsque une VM tourne alors que le ONBOOT="no" ou qu'une VM est arrêtée alors que ONBOOT="yes"

function check_running_vz
{   
    status=`vzlist -aH | awk '{printf "%s /etc/vz/conf/%s.conf\n",$3,$1}' | sed -e 's/running/"ONBOOT=.yes."/' -e 's/stopped/"ONBOOT=.no."/' | xargs -n 2 grep -L`
    if [[ "$status" == "" ]]; then
	echo "0 VZ_Running test=0 OK - Toutes les VMs à lancer sont démarrées"  
    else
	echo -n "2 VZ_Running test=1 CRITICAL - Des VMs sont lancées ou stoppées alors que le contraire est indiqué dans le fichier de conf - " 
	echo $status | sed 's/[^0-9 ]*//g'
    fi
    cd "$CWD"
}

check_running_vz
