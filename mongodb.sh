script_location=$(pwd)

echo "save the repo file on yum repos to install the mongo"
cp ${script_location}/files/mongodb.repo /etc/yum.repos.d/mongo.repo

echo "Installing mongodb from repo"
yum install mongodb-org -y

echo "start and enable the mongod service"

systemctl enable mongod
systemctl start mongod

sed -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf