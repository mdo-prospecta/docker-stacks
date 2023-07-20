# Prospecta On Prem Docker Stacks

| Service               | Name                  | Server     | IP             |
| --------------------- | --------------------- | ---------- | -------------- |
| haproxy               | haproxy-01            | obsidian   | 192.168.10.40  |
| haproxy               | haproxy-02            | bloodstone | 192.168.10.41  |
| haproxy               | haproxy-03            | amethyst   | 192.168.10.42  |
|                       |                       |            |                |
| postgresql            | postgres14-01         | obsidian   | 192.168.10.43  |
| postgresql            | postgres14-02         | bloodstone | 192.168.10.44  |
|                       |                       |            |                |
| rabbitmq              | rabbitmq-01           | bloodstone | 192.168.10.85  |
| rabbitmq              | rabbitmq-02           | bloodstone | 192.168.10.86  |
|                       |                       |            |                |
| pghero                | pghero                | bloodstone | 192.168.10.84  |
|                       |                       |            |                |
| elasticsearch         | es01                  | bloodstone | 192.168.10.87  |
| elasticsearch         | es02                  | bloodstone | 192.168.10.88  |
| elasticsearch         | es03                  | bloodstone | 192.168.10.89  |
|                       |                       |            |                |
| sftp                  | sftp                  | obsidian   | 192.168.10.51  |
|                       |                       |            |                |
| opensearch            | opensearch-node1      | obsidian   | 192.168.10.47  |
| opensearch            | opensearch-node2      | bloodstone | 192.168.10.48  |
| opensearch            | opensearch-node3      | amethyst   | 192.168.10.49  |
| opensearch-dashboards | opensearch-dashboards | obsidian   | 192.168.10.50  |
|                       |                       |            |                |
| awscli                | awscli                | obsidian   | 192.168.10.52  |
|                       |                       |            |                |
| pgadmin4              | pgadmin4              | obsidian   | 192.168.10.53  |
|                       |                       |            |                |
| nginx                 | nginx-01              | bloodstone | 192.168.10.81  |
| nginx                 | nginx-02              | bloodstone | 192.168.10.82  |
|                       |                       |            |                |
| spark-master          | spark-master          | bloodstone | 192.168.10.106 |
| spark-worker          | spark-worker-01       | bloodstone | 192.168.10.92  |
| spark-worker          | spark-worker-02       | bloodstone | 192.168.10.93  |


# Running portainer on host networking mode
sudo docker run -d \
  --network host \
  --name portainer --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /zfs_master/docker/data/portainer:/data portainer/portainer-ce:latest


# Docker run  commands for Master & Worker Node 
Master docker run -p 127.0.0.1:8080:8080 -p 127.0.0.1:7077:7077 -p 127.0.0.1:6066:6066 -p 127.0.0.1:8998:8998 <image>

Worker docker run -e SPARK_MASTER=spark://<master-host-ip>:7077 -p 127.0.0.1:8081:8081 <image>

