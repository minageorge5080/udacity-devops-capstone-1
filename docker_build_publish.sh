docker build --tag valentinburk/$1:$2 .
docker images --all
docker login
echo "Docker ID and Image: $dockerpath"
docker push $dockerpath