#!/bin/bash


server_ip_address=$1
base_port_number=$2
number_of_servers=$3
number_of_clients=$4
request_count_per_client=$5

# removes the logs file
rm -f client.log
# kills previos clients
#sudo killall -r client.sh


for (( i=1; i<=$number_of_clients; i++ ))
do 

    ./client.sh $server_ip_address $base_port_number $number_of_servers $request_count_per_client >> client.log &

done

# after running clients, show client logs using the tail command
tail -100f client.log
