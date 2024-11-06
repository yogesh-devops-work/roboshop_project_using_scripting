source common.sh

set -e

echo "installing ngnix service"
yum install ngnix -y
status_check

echo "deleting default data of ngnix"
rm -rf /usr/share/nginx/html/*
status_check

echo "downloding project data from url by using curl command"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
status_check

cd /usr/share/nginx/html

echo "unzip the project files on specific dir"
unzip /tmp/frontend.zip
status_check

echo "copy the file data from git to nginx config "
cp ${script_location}/files/nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf
status_check

echo "start and enable the nginx service"
systemctl enable nginx
status_check
systemctl start nginx
status_check

