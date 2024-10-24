script_location=$(pwd)

echo "disable latest nodejs package"
yum module disable nodejs -y

echo "installing module for specific version of nodejs"
yum module enable nodejs:18 -y

echo "Installing nodejs on server"
yum install nodejs -y

echo "create new user"










systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue


