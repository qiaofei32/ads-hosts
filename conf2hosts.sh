echo -e "\n" >> hosts
cat dnsmasq.conf | sed -e 's:\/127\.0\.0\.1::' -e 's:address\=\/:127\.0\.0\.1 :' >> hosts
cat hosts | grep "127.0.0.1" | sort | uniq > tmp.hosts
rm -rf hosts
mv tmp.hosts hosts