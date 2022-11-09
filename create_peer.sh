#!/bin/bash

SMALL_NAME=$1
IPADDR=$2
DESC=$3

echo $SMALL_NAME $IPADDR $DESC

if [ -z "$1" ]; then
  echo "need a small name"
  exit 1
fi

if [ -z "$2" ]; then
  echo "need an ip address"
  exit 1
fi

if [ -z "$3" ]; then
  echo "no description provided"
  exit 1
fi

umask 077
wg genkey | tee ${SMALL_NAME}.key | wg pubkey > ${SMALL_NAME}.pub

SERVER_PUBKEY=`sudo cat /etc/wireguard/main.key | wg pubkey`
USER_PKEY=`cat ${SMALL_NAME}.key`
cp template-peer.conf ${SMALL_NAME}.conf

sed -i "s/<address>/${IPADDR}/g" ${SMALL_NAME}.conf
sed -i "s_<serverkey>_${SERVER_PUBKEY}_g" ${SMALL_NAME}.conf
sed -i "s_<privatekey>_${USER_PKEY}_g" ${SMALL_NAME}.conf

USER_PUBK=`cat ${SMALL_NAME}.pub`
cat > ${SMALL_NAME}.peer <<FOOEOF

# $DESC
[Peer]
PublicKey = $USER_PUBK
AllowedIPs = 10.10.0.${IPADDR}/32
FOOEOF

sudo cp /etc/wireguard/wg0.conf /etc/wireguard/wg0.conf.bak
cat ${SMALL_NAME}.peer | sudo tee -a /etc/wireguard/wg0.conf

sudo wg set wg0 peer $USER_PKEY allowed-ips 10.10.0.${IPADDR}/32

qrencode -t png -o ${SMALL_NAME}.png < ${SMALL_NAME}.conf
