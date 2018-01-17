rm -rf easylistchina+easylist.txt
wget -q https://easylist-downloads.adblockplus.org/easylistchina+easylist.txt 

echo -e "\n" >> dnsmasq.conf
cat easylistchina+easylist.txt | grep ^\|\|[^\*]*\^$ | sed -e 's:||:address\=\/:' -e 's:\^:/127\.0\.0\.1:' >> dnsmasq.conf

echo -e "\n" >> dnsmasq.conf
cat new-ads-list.txt | awk '{print "address=/"$1"/127.0.0.1"}' >> dnsmasq.conf

cat dnsmasq.conf | grep "address" | sort | uniq > tmp.conf
rm -rf dnsmasq.conf
mv tmp.conf dnsmasq.conf
