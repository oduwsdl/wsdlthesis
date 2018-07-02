#!/usr/bin/env bash

IMG=oduwsdl/wsdlthesis
USR=$(id -u):$(id -g)

CMD="docker container run --rm -it -v $PWD:/src -u $USR $IMG $@"

echo
echo Executing the following Docker command:
echo
echo $CMD
echo

$CMD
