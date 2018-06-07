cp /vagrant/aliyun.mirror.sources.list /etc/apt/sources.list
apt-get update
#apt-get install -y apache2
#if ! [ -L /var/www ]; then
#  rm -rf /var/www
#  ln -fs /vagrant /var/www
#fi

#modified the hostname
echo "foreman.test.hq.bestv.com.cn">/etc/hostname
echo "10.0.2.15 foreman.test.hq.bestv.com.cn foreman">>/etc/hosts
hostname foreman.test.hq.bestv.com.cn

apt-get -y install ca-certificates
wget https://apt.puppetlabs.com/puppet5-release-xenial.deb
dpkg -i puppet5-release-xenial.deb
echo "deb http://deb.theforeman.org/ xenial 1.17" > /etc/apt/sources.list.d/foreman.list
echo "deb http://deb.theforeman.org/ plugins 1.17" >> /etc/apt/sources.list.d/foreman.list
apt-get -y install ca-certificates
wget -q https://deb.theforeman.org/pubkey.gpg -O- | apt-key add -

#install foreman-installer
apt-get update && apt-get -y install foreman-installer

#install foreman 
foreman-installer
