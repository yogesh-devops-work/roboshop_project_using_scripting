script_location=$(pwd)

echo "disable latest nodejs package"
yum module disable nodejs -y

echo "installing module for specific version of nodejs"
yum module enable nodejs:18 -y

echo "Installing nodejs on server"
yum install nodejs -y

echo "create new user" 
useradd roboshop

echo "create new directory for app download"

mkdir -p /app

echo "download application code from specific url"

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip 

echo "deleted all the files from directory"
rm -rf /app/*

cd /app

echo "unzip the application code in the directory"
unzip /tmp/catalogue.zip

echo "install npm to see the files of data"
npm install

echo "save the file on systemd dir to create new service in the server"
cp ${script_location}/files/catalogue.service /etc/systemd/system/catalogue.service

echo "used to reload the systemd daemon configuration files without restarting"
systemctl daemon-reload

echo "enabling and starting the service on the server"
systemctl enable catalogue
systemctl start catalogue

echo "All commands for catalogue server completed and done and start the service on server"


