#!/bin/bash

export SPARK_MASTER_HOST=${SPARK_MASTER_HOST:-`hostname`}

export SPARK_HOME=/opt/spark

. "/opt/spark/sbin/spark-config.sh"

. "/opt/spark/bin/load-spark-env.sh"

/opt/livy/bin/livy-server start

cd /opt/spark/bin && /opt/spark/sbin/../bin/spark-class org.apache.spark.deploy.master.Master \
    --ip $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT 
