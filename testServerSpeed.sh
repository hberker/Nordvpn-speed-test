#!/bin/bash
cd /etc/openvpn-2.4.6/ovpn_udp
SERVER=12393
echo "server: " $SERVER >> /home/hosni/Desktop/connectivityTest.txt
for filename in us*; do
    #Connect to this vpn 
    echo $filename
    #Wait for inet connection
    (sudo openvpn $filename &)
    for ((var = 1; var <= 20; var++)); do
        if ! ifconfig | grep "tun0" > /dev/null; then 
            sleep 1
            echo "Connecting..."
        else 
            echo "Connected"
            echo $filename >> /home/hosni/Desktop/connectivityTest.txt
            speedtest-cli --simple --server $SERVER >> /home/hosni/Desktop/connectivityTest.txt
            echo "   " >> /home/hosni/Desktop/connectivityTest.txt
            sudo kill $(pgrep openvpn)
            continue
        fi 
    done
    sudo kill $(pgrep openvpn)
done