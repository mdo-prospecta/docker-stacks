FROM redhat/ubi8
LABEL maintainer "Panther <jayant.saikia@prospecta.com>"

USER root

ENV JAVA_HOME /etc/alternatives/jre
ENV SPARK_VERSION "3.2.1"
ENV HADOOP_VERSION "3.2"
ENV LIVY_BUILD_VERSION "0.7.1-incubating"
ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_WORKER_WEBUI_PORT 8081
ENV SPARK_MASTER ""
#ENV SPARK_MASTER "spark://spark-master:7077"

RUN curl https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION.tgz -o /opt/spark.tgz
RUN curl https://dlcdn.apache.org/incubator/livy/$LIVY_BUILD_VERSION/apache-livy-$LIVY_BUILD_VERSION-bin.zip -o /opt/livy.zip

RUN dnf install -y hostname unzip java-1.8.0-openjdk-devel --nodocs python3 python3-pip procps \
    && tar -xvzf /opt/spark.tgz \
    && rm /opt/spark.tgz \
    && mv spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION /opt/spark \
    && unzip /opt/livy.zip \
    && rm /opt/livy.zip \
    && mv apache-livy-$LIVY_BUILD_VERSION-bin /opt/livy

COPY start.sh /opt/
COPY master.sh /opt/
COPY worker.sh /opt/

EXPOSE 8080 8081 7077 6066 8998

#ENTRYPOINT ["tail", "-f", "/dev/null"]

CMD ["/bin/bash", "/opt/start.sh"]
