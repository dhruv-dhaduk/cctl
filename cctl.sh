#/bin/bash


# End of scaffold_project function
scaffold_project() {

mkdir $1
mkdir $1/include $1/src
touch $1/CMakeLists.txt $1/main.cpp $1/include/hello.hpp $1/src/hello.cpp

cat << EOF > $1/CMakeLists.txt
cmake_minimum_required(VERSION 3.10)
project(${1} VERSION 1.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

file(GLOB_RECURSE SRC_FILES src/*.cpp)

add_executable(${1} main.cpp \${SRC_FILES})
target_include_directories(${1} PUBLIC include)
EOF

cat << EOF > ${1}/main.cpp
#include "hello.hpp"

int main()
{
    hello();
    return 0;
}
EOF

cat << EOF > ${1}/include/hello.hpp
#pragma once

void hello();
EOF

cat << EOF > ${1}/src/hello.cpp
#include <iostream>
#include "hello.hpp"

void hello(){
    std::cout << "hello" << std::endl;
}
EOF

}
# End of scaffold_project function


if [ "$1" = "build" ]; then
    cmake -S . -B build
    make -C ./build
elif [ "$1" = "run" ]; then
    ./build/$2
elif [ "$1" = "clean" ]; then
    make -C ./build clean
elif [ "$1" = "cleanall" ]; then
    rm -rf build
elif [ "$1" = "create" ]; then
    if [ $# -eq 2 ]; then
        scaffold_project "$2"
    else
        echo "Please provide the name of the project"
    fi
fi


