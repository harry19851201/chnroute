#!/bin/sh
mkdir -p ./pbr
cd ./pbr

# AS4809 BGP
wget --no-check-certificate -c -O CN.txt https://github.com/mayaxcn/china-ip-list/blob/master/chn_ip.txt

{
echo "/ip firewall address-list"

for net in $(cat CN.txt) ; do
  echo "add list=CN address=$net comment=AS4809"
done

} > ../CN.rsc

cd ..
rm -rf ./pbr
