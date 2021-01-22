#!/bin/bash


read -p "Server IP Address: " server_ip_address
read -p "Base port number: " base_port_number
read -p "Number of servers: " number_of_servers
read -p "Number of clients to lunch: " number_of_clients
read -p "Number of request per client : " number_of_requests

# removes the logs file
rm -f client.log
# kills previos clients
sudo killall -r client-app


for (( i=1; i<=$number_of_clients; i++ ))
do 
    echo $i
    ./client.sh $server_ip_address $base_port_number $number_of_servers $number_of_requests >> client.log &

done

# after running clients, show client logs using the tail command
tail -100f client.log
