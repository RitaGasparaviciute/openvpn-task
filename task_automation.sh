#!/bin/bash


# Checking if required packages are installed
# Checking if root user is enabled
if [[ "$EUID" -ne 0 ]];
then
	echo "This script needs to be run as root."
	exit
else
INSTALL_CHECK="apt-mark showinstall"

$INSTALL_CHECK egrep ''^"$nginx"$'|'^"$bridge"-utils$'|'^"$openvpn"$'' && echo "It's installed" || echo "What I need is not installed"
#if echo "It's installed"
if echo "What I need is not installed" > /dev/null
then
while true; do
     read -p "Do you wish to install required items?" yn
     case $yn in
         [Yy]* )
         echo "Nginx is going to be installed" &&
            apt-get install nginx -y &&
         echo "OpenVPN is going to be installed" &&
            apt-get install openvpn -y &&
            wget https://git.io/vpn -O openvpn-install.sh &&
         echo "bridge-utils is going to be installed" &&
             apt-get install bridge-utils -y &&
         echo "EasyRSA is going to be installed to etc/openvpn/" &&
         cd /etc/openvpn/ &&
         wget https://github.com/OpenVPN/easy-rsa/releases/download/v3.0.6/EasyRSA-unix-v3.0.6.tgz
         tar -xf EasyRSA-unix-v3.0.6.tgz
         mv EasyRSA-v3.0.6/ easy-rsa/; rm -f EasyRSA-unix-v3.0.6.tgz
         echo "All done" && exit;;
         [Nn]* )    echo "Ok then I'll stop" && exit;;
         * )    echo "Please answer yes or no.";;
    esac
done
	
    fi

fi


task_automation.sh
Displaying task_automation.sh.
