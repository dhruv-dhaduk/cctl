#/bin/bash

if [ "$1" = "build" ]; then
    cmake -S . -B build
    make -C ./build
elif [ "$1" = "run" ]; then
    ./build/$2
elif [ "$1" = "clean" ]; then
    make -C ./build clean
elif [ "$1" = "cleanall" ]; then
    rm -rf build
fi
