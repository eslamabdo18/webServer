sudo -i
apt-get update 
apt-get remove docker docker-engine docker.io containerd runc
apt install docker.io
systemctl start docker
systemctl enable docker
echo "Done installing docker"
cd backend 
docker build -f Dockerfile -t backend .
cd ..
cd frontend
docker build -f Dockerfile -t frontend .
cd ..
docker-compose up --build

echo "Done"
