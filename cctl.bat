@echo off

if "%1"=="build" (
    cmake -S . -B build -G "MinGW Makefiles"
    make -C .\build
) else if "%1"=="run" (
    .\build\%2
) else if "%1"=="clean" (
    make -C .\build clean
) else if "%1"=="cleanall" (
    rmdir /s /q build
)
