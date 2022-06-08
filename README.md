# Prospecta On Prem Docker Stacks

# Obsidian
| Container      |       IP        |
| :--            |       :--:      |
| haproxy01      | 192.168.10.40   |
| postgres14     | 192.168.10.43   |
| mssql2019      | 192.168.10.44   |
| rabbitmq01     | 192.168.10.45   |
| rabbitmq02     | 192.168.10.46   |
| opensearch01   | 192.168.10.47   |
| opensearch02   | 192.168.10.48   |
| opensearch03   | 192.168.10.49   |
| kibana         | 192.168.10.50   |
| sftp           | 192.168.10.51   |

# Bloodstone
| Container      |       IP        |
| :--            |       :--:      |
| nginx01        | 192.168.10.81   |
| nginx02        | 192.168.10.82   |
| mssql2019      | 192.168.10.84   |
| rabbitmq01     | 192.168.10.85   |
| rabbitmq02     | 192.168.10.86   |
| elastic79      | 192.168.10.87   |
| elastic79      | 192.168.10.88   |
| elastic79      | 192.168.10.89   |
| sftp           | 192.168.10.91   |
| spark-livy     | 192.168.10.106  |
| spark-worker1  | 192.168.10.92   |
| spark-worker2  | 192.168.10.93   |


# Running portainer on host networking mode
sudo docker run -d \
  --network host \
  --name portainer --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /zfs_master/docker/data/portainer:/data portainer/portainer-ce:latest


# Docker run  commands for Master & Worker Node 
Master docker run -p 127.0.0.1:8080:8080 -p 127.0.0.1:7077:7077 -p 127.0.0.1:6066:6066 -p 127.0.0.1:8998:8998 <image>

Worker docker run -e SPARK_MASTER=spark://<master-host-ip>:7077 -p 127.0.0.1:8081:8081 <image>

