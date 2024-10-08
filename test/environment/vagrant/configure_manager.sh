#!/usr/bin/env bash

master_ip=$1
manager_type=$2
node_name=$3
cyb3rhq_api_folder=$4

apt-get update
curl -s https://s3-us-west-1.amazonaws.com/packages-dev.wazuh.com/key/GPG-KEY-CYB3RHQ | apt-key add -
echo "deb https://s3-us-west-1.amazonaws.com/packages-dev.wazuh.com/pre-release/apt/ unstable main" | tee -a /etc/apt/sources.list.d/cyb3rhq_pre_release.list

apt-get update
apt-get install cyb3rhq-manager -y
apt-get install python python-cryptography -y

curl -sL https://deb.nodesource.com/setup_8.x | bash -
apt-get install nodejs gcc -y
npm install mocha -g
npm install glob supertest mocha should moment
npm config set user 0
cd ${cyb3rhq_api_folder}
${cyb3rhq_api_folder}/install_api.sh
API_CONF_FOLDER=/var/ossec/api/configuration
PRECONF_FILE=${API_CONF_FOLDER}/preloaded_vars.conf
cat <<EOT >> ${PRECONF_FILE}
HTTPS=Y
AUTH=Y
COUNTRY="US"
STATE="State"
LOCALITY="Locality"
ORG_NAME="Org Name"
ORG_UNIT="Org Unit Name"
COMMON_NAME="Common Name"
PASSWORD="password"
USER=foo
PASS=bar
PORT=55000
PROXY=N
EOT
/var/ossec/api/scripts/configure_api.sh

sed -i "s:config.experimental_features  = false;:config.experimental_features = true;:g" /var/ossec/api/configuration/config.js
sed -i "s:config.cache_enabled = \"yes\";:config.cache_enabled = \"no\";:g" /var/ossec/api/configuration/config.js

systemctl restart cyb3rhq-api

/var/ossec/bin/ossec-control enable agentless
/var/ossec/bin/ossec-control enable client-syslog
/var/ossec/bin/ossec-control enable integrator

if [ "X${manager_type}" = "Xmaster" ]
then
    cat << EOT >> /var/ossec/etc/local_internal_options.conf
    cyb3rhq_database.sync_syscheck=1
EOT

    cp /vagrant/ossec_master.conf /var/ossec/etc/ossec.conf
else
    sed -i "s:<node_type>master</node_type>:<node_type>worker</node_type>:g" /var/ossec/etc/ossec.conf
fi

sed -i "s:<key></key>:<key>9d273b53510fef702b54a92e9cffc82e</key>:g" /var/ossec/etc/ossec.conf
sed -i "s:<node>NODE_IP</node>:<node>$master_ip</node>:g" /var/ossec/etc/ossec.conf
sed -i -e "/<cluster>/,/<\/cluster>/ s|<disabled>[a-z]\+</disabled>|<disabled>no</disabled>|g" /var/ossec/etc/ossec.conf
sed -i "s:<node_name>node01</node_name>:<node_name>$node_name</node_name>:g" /var/ossec/etc/ossec.conf
systemctl restart cyb3rhq-manager

if [ "X${manager_type}" = "Xmaster" ]
then
    /var/ossec/bin/ossec-maild
    /var/ossec/bin/ossec-authd
fi

echo "Configure OK"
