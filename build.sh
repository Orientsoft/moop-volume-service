TAG=`git rev-parse --short HEAD`
REGISTRY=registry.datadynamic.io/moop
IMAGE=moop-volume-service

docker build -t $REGISTRY/$IMAGE:$TAG -f Dockerfile .
if [ $? -ne 0 ]; then
    echo "fail"
else
    echo "success"
    docker push  $REGISTRY/$IMAGE:$TAG
fi

