FROM centos:7

ENV HADOOP_VERSION	2.6.0
ENV HADOOP_HOME		/usr/local/hadoop
ENV PATH		$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH:/activator-dist-1.3.9/bin
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
ENV ELEPHANT_CONF_DIR=/dr-elephant/app-conf

VOLUME $HADOOP_HOME/etc/hadoop/

RUN yum install -y java-1.8.0-openjdk-devel wget unzip git which zip mariadb
RUN wget https://downloads.typesafe.com/typesafe-activator/1.3.9/typesafe-activator-1.3.9.zip
RUN git clone https://github.com/linkedin/dr-elephant.git
RUN unzip typesafe-activator-1.3.9.zip

RUN wget http://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz  && tar -zxf /hadoop-$HADOOP_VERSION.tar.gz && \
    rm /hadoop-$HADOOP_VERSION.tar.gz && mv hadoop-$HADOOP_VERSION /usr/local/hadoop && mkdir -p /usr/local/hadoop/logs 

RUN cd /dr-elephant && ./compile.sh /dr-elephant/app-conf/compile.conf && unzip /dr-elephant/dist/dr-elephant-2.0.3-SNAPSHOT.zip  && cp -r /dr-elephant/app-conf /dr-elephant/scripts /dr-elephant-2.0.3-SNAPSHOT &&  mv /dr-elephant /dr-elephant-sources && ln -sf dr-elephant-2.0.3-SNAPSHOT  /dr-elephant && rm typesafe-activator-1.3.9.zip && mkdir -p /dr-elephant/logs/

COPY entrypoint.sh /
COPY start.sh /



ENTRYPOINT ["/entrypoint.sh"]
CMD ["/start.sh"]

