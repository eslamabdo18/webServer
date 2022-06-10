echo "clone repo from github"

cd backend 
docker build -f Dockerfile -t backend .
cd ..
cd frontend
docker build -f Dockerfile -t frontend .
cd ..
docker-compose up --build
