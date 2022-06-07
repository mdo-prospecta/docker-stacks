#!/bin/bash

if [ -z "$SPARK_MASTER" ]
then
  . "/opt/master.sh"
else
  . "/opt/worker.sh"
fi
