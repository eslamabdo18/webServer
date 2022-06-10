sudo apt-get update 
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
echo "Done installing docker"
cd backend 
docker build -f Dockerfile -t backend .
cd ..
cd frontend
docker build -f Dockerfile -t frontend .
cd ..
docker-compose up --build

echo "Done"
