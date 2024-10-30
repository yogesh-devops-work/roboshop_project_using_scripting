source common.sh

echo "disable latest nodejs package"
yum module disable nodejs -y
status_check

echo "installing module for specific version of nodejs"
yum module enable nodejs:18 -y
status_check

echo "Installing nodejs on server"
yum install nodejs -y
status_check

echo "create new user" 
useradd roboshop
status_check

echo "create new directory for app download"
mkdir -p /app

echo "download application code from specific url"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip 
status_check

echo "deleted all the files from directory"
rm -rf /app/*
status_check

cd /app

echo "unzip the application code in the directory"
unzip /tmp/catalogue.zip
status_check

echo "install npm to see the files of data"
npm install
status_check

echo "save the file on systemd dir to create new service in the server"
cp ${script_location}/files/catalogue.service /etc/systemd/system/catalogue.service
status_check

echo "used to reload the systemd daemon configuration files without restarting"
systemctl daemon-reload
status_check

echo "enabling and starting the service on the server"
systemctl enable catalogue
status_check
systemctl start catalogue
status_check


