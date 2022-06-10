sudo apt-get update 
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Done installing docker"
cd backend 
docker build -f Dockerfile -t backend .
cd ..
cd frontend
docker build -f Dockerfile -t frontend .
cd ..
sudo chmod 777 /var/run/docker.sock

sudo systemctl restart webapp.service 
echo "Done"
