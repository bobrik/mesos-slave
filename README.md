# Dockerized mesos slave that can spawn docker containers

Just use `mesosphere/mesos-slave` and bind-mount `/sys/fs/cgroup:/sys/fs/cgroup`
into your container, that should be enough.

This image is not needed anymore.
