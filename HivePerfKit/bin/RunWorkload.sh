#!/bin/bash

if [ -z $1 ]
then
    echo "usage RunQueries.sh WORKLOAD"
    exit 1
else
    WORKLOAD_NAME=$1
fi

set -a
export WORKLOAD=$WORKLOAD_NAME
export RUN_ID=$STARTTIME
source ./globalconfig.sh
source ${WORKLOAD_HOME}/config.sh
set +a

if [ $SKIP_PRERUN !=  true ]
then
    ${WORKLOAD_HOME}/setup.sh >> $BUILD_LOG_FILE
    ${WORKLOAD_HOME}/prerun.sh >> $BUILD_LOG_FILE
fi

./RunQueries.sh $WORKLOAD_NAME


