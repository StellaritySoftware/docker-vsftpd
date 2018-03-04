#!/bin/bash

echo "pasv_address=${PASV_ADDRESS}" >> /etc/vsftpd.conf

echo "************************************"
echo "* Wellcome to VSFTPD docker image! *"
echo "************************************"
echo
echo "Using passive address: ${PASV_ADDRESS}"
echo "Mode is set to: ${MODE}"
echo

if [ ${MODE} = 'FTPS' ]; then
    echo "ssl_enable=YES" >> /etc/vsftpd.conf
    echo "implicit_ssl=YES" >> /etc/vsftpd.conf
    echo "listen_port=990" >> /etc/vsftpd.conf
elif [ ${MODE} = 'FTPES' ]; then
    echo "ssl_enable=YES" >> /etc/vsftpd.conf
    echo "require_ssl_reuse=NO" >> /etc/vsftpd.conf
fi

echo "Starting..."
service vsftpd start > nul

echo "Running..."
tail -f /var/log/vsftpd.log
#bash
