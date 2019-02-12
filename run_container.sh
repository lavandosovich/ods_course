IMAGE_NAME=custom.ds.image
#IMAGE_NAME=jupyter/datascience-notebook
CONT_PORT=8888
MCH_PORT=10000
CONT_NAME=custom.ds.cont
CONT_PATH=/home/jovyan/work
MCH_PATH="$PWD"


docker build . --rm -t ${IMAGE_NAME} 
docker stop ${CONT_NAME} && docker rm ${CONT_NAME}

echo "::: Running container ..."
docker run --rm -e JUPYTER_LAB_ENABLE=yes -p ${MCH_PORT}:${CONT_PORT} --name ${CONT_NAME} -v ${MCH_PATH}:${CONT_PATH} -d ${IMAGE_NAME} &&
echo "::: Container has been started." &&
echo "::: Deploying - done"

sleep 2

TOKEN=$(docker logs custom.ds.cont 2>&1 | grep -Po "(?<=token=)\w*" | head -1)

echo "::: Open http://localhost:${MCH_PORT}/?token=${TOKEN}"
