#!/bin/bash
appname="docker-powermta"
currentdir=$(pwd)
mac=$(cat /sys/class/net/docker0/address | sed 's/://g')
echo Updating mac: $mac
sed -i "/mac:/c\mac: $mac" PMTA/license

echo $1 $2

run() {
    echo "docker run \
    $env \
    $cond \
    --net=host \
    --name=$appname \
    --log-opt max-size=50M \
    --log-opt max-file=1 \
    -v $currentdir/etc/pmta:/etc/pmta \
    -d \
    --restart=unless-stopped $appname"
}

if [[ $1 == "local" ]]
  then

  if [ $2 == "deploy" ]
      then
      docker build -t $appname .
      docker stop $appname
      docker rm $appname
      eval $(run)
  fi

  if [ $2 == "stop" ]
      then
      docker stop $appname
  fi

  if [ $2 == "exec" ]
      then
      docker exec -it $appname $3
  fi

  if [ $2 == "start" ]
      then
      docker start $appname
  fi

  if [ $2 == "logs" ]
      then
      docker logs -f $appname
  fi
fi
