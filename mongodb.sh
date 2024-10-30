source common.sh

echo "save the repo file on yum repos to install the mongo"
cp ${script_location}/files/mongodb.repo /etc/yum.repos.d/mongo.repo
status_check

echo "Installing mongodb from repo"
yum install mongodb-org -y
status_check

echo "start and enable the mongod service"

systemctl enable mongod
status_check
systemctl start mongod
status_check

sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
status_check