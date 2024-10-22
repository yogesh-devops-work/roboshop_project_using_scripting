script_location=$(pwd)

# shellcheck disable=SC1073
echo "installing ngnix service"
yum install ngnix -y

echo "deleting default data of ngnix"
rm -rf /usr/share/nginx/html/*

echo "downloding project data from url by using curl command"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

cd /usr/share/nginx/html

echo "unzip the project files on specific dir"
unzip /tmp/frontend.zip

echo "copy the file data from git to nginx config "

cp ${script_location}/files/nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf

echo "start and enable the nginx service"
systemctl enable nginx
systemctl start nginx

