# Dr.Elephant in Docker

* requires docker-compose & docker >= 1.10
* checkout the project
* docker-compose build
* copy your hadoop config into ./hadoop-conf
* minimum config tested :

## core-site.xml
```xml
<configuration>
        <property>
                <name>fs.default.name</name>
                <value>hdfs://NAMENODE_HOSTNAME</value>
        </property>
</configuration>
``` 

## mapred-site.xml
```xml
<configuration>
<property>
 <name>mapreduce.framework.name</name>
 <value>yarn</value>
</property>
</configuration>
```

## yarn-site.xml
```xml
<configuration>
<property>
 <name>yarn.nodemanager.aux-services</name>
 <value>mapreduce_shuffle</value>
</property>
<property>
 <name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
 <value>org.apache.hadoop.mapred.ShuffleHandler</value>
</property>
<property>
 <name>yarn.resourcemanager.hostname</name>
 <value>RESOURCE_MANAGER_HOSTNAME</value>
</property>

<property>
  <name>mapreduce.jobhistory.webapp.address</name>
  <value>JOB_HISTORY_HOSTNAME:19888</value>
</property>

</configuration>
```

* docker-compose start
* point your browser to http://yourhost:9000
* Enjoy!


##More detailed installation
* Install docker & docker-compose
* git clone https://github.com/codingtony/dr-elephant-docker
* cd dr-elephant-docker
* mkdir hadoop-conf
* copy or create your hadoop cluster config in hadoop-conf.
* docker-compose build
* docker-compose up
* docker-compose start
* Then when it's up, you can connect to http://localhost:9000 (or use the hostname of the machine where you are running docker from)




