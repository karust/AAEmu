#!bin/bash

FRAMEWORK=netcoreapp2.2

CONFIGURATION=Debug
#CONFIGURATION=Release
runtime="ubuntu.18.04-x64"

rm -rf build;
mkdir -p build/;

dotnet publish -c $CONFIGURATION -r $runtime --self-contained true;


mkdir -p build/Login;
mv AAEmu.Login/bin/$CONFIGURATION/$FRAMEWORK/$runtime/publish/* build/Login;

mkdir -p build/Game;
mv AAEmu.Game/bin/$CONFIGURATION/$FRAMEWORK/$runtime/publish/* build/Game;

cp AAEmu.Game/Config.json build/Game;
cp AAEmu.Login/Config.json build/Login;

mkdir -p build/Game/Data;
cp -r AAEmu.Game/Data/* build/Game/Data;
