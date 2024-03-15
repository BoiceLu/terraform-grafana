sudo apt-get update
chmod 700 /root/docker-install.sh
bash /root/docker-install.sh >> /root/docker-install.log
mv /root/docker-install.sh /root/docker-install.sh.EXECUTED #prevent it from running again
cd /root/
chmod 600 /root/.ssh/id_rsa
git clone ssh://pilinato@gmail.com@source.developers.google.com:2022/p/repositories-344201/r/grafana-backup /root/grafana
cd /root/grafana
chmod 777 cof/ data/
docker-compose up -d
