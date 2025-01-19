@echo off

if "%1"=="build" (
    cmake -S . -B build -G "Visual Studio 17 2022"
    cmake --build .\build
) else if "%1"=="run" (
    .\build\Debug\%2
) else if "%1"=="clean" (
    cmake --build .\build --target clean
) else if "%1"=="cleanall" (
    rmdir /s /q build
)
