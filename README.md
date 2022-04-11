# docker-stacks
Docker stacks

# Running portainer on host networking mode
sudo docker run -d \
  --network host \
  --name portainer --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /zfs_master/docker/data/portainer:/data portainer/portainer-ce:latest
