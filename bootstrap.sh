#!/usr/bin/env bash


which python;
if [[ "$?" == "0" ]];
then 
echo "python already installed"
else 
echo "python nie je instalovany, instalujem"
apt-get update
apt-get install python python-dev python-pip -q -y
fi