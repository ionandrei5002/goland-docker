#!/bin/bash

cache="/home/andrei/dockerbuilds/goland-docker/.cache"
goland="/home/andrei/dockerbuilds/goland-docker/.GoLand2019.2"
java="/home/andrei/dockerbuilds/goland-docker/.java"
projects="/home/andrei/GoProjects"

if [ -d  "$cache" ]
then 
    echo "Directory $cache exists."
else
    mkdir -p $cache
    echo "Directory $cache created."
fi

if [ -d  "$goland" ]
then 
    echo "Directory $goland exists."
else
    mkdir -p $goland
    echo "Directory $goland created."
fi

if [ -d  "$java" ]
then 
    echo "Directory $java exists."
else
    mkdir -p $java
    echo "Directory $java created."
fi

if [ -d  "$projects" ]
then 
    echo "Directory $projects exists."
else
    mkdir -p $projects
    echo "Directory $projects created."
fi

docker run --rm -it -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $cache:/home/andrei/.cache \
    -v $goland:/home/andrei/.GoLand2019.2 \
    -v $java:/home/andrei/.java \
    -v $projects:/home/andrei/go/src/ \
    --env _JAVA_AWT_WM_NONREPARENTING=1 \
    --env AWT_TOOLKIT=MToolkit \
    goland-docker:latest