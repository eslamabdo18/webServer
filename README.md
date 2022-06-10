
http://18.118.147.63:3000/ -> to see the frontend 

- clone the repo 
- cd webServer

ssh -i "webServerKey.pem" ubuntu@ec2-18-118-147-63.us-east-2.compute.amazonaws.com

then clone the project again in the aws instance  

before runnig the script 
sudo vi /etc/systemd/system/webapp.service
and put this script in this file 
    [Unit]
    Description=Docker Compose WIKIJS Service
    Requires=docker.service
    After=docker.service network.target

    [Service]
    Type=oneshot
    RemainAfterExit=yes
    WorkingDirectory=/home/ubuntu/webServer
    ExecStart=/usr/local/bin/docker-compose up -d --build
    ExecStop=/usr/local/bin/docker-compose down
    TimeoutStartSec=0

    [Install]
    WantedBy=multi-user.target


run ./deploy.sh 

then wait for the installtion 

http://18.118.147.63:3000/


if you want to start after deploymennt 
sudo systemctl start webapp.service 

if you want to stop it 
sudo systemctl stop webapp.service 

