#!/bin/bash

echo "pasv_address=${PASV_ADDRESS}" >> /etc/vsftpd.conf
echo "pasv_min_port=${PASV_MIN_PORT}" >> /etc/vsftpd.conf
echo "pasv_max_port=${PASV_MAX_PORT}" >> /etc/vsftpd.conf


echo "************************************"
echo "* Wellcome to VSFTPD docker image! *"
echo "************************************"
echo
echo "Using passive address: ${PASV_ADDRESS}"
echo "Using passive port: ${PASV_MIN_PORT}-${PASV_MAX_PORT}"
echo "Mode is set to: ${MODE}"
echo

case "${MODE}" in
    FTP)
        ;;
    FTPS)
        echo "ssl_enable=YES" >> /etc/vsftpd.conf
        echo "implicit_ssl=YES" >> /etc/vsftpd.conf
        echo "listen_port=990" >> /etc/vsftpd.conf
        ;;
    FTPES)
        echo "ssl_enable=YES" >> /etc/vsftpd.conf
        echo "require_ssl_reuse=NO" >> /etc/vsftpd.conf
        ;;
    *)
        echo 'Wrong $FTP_MODE!!! (set it to FTP, FTPS or FTPES)'
        exit 1
        ;;
esac

echo "Starting..."
service vsftpd start > nul

echo "Running..."
tail -f /var/log/vsftpd.log
