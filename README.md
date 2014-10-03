# Dockerized mesos slave that can spawn docker containers

[Original mesos-slave](https://github.com/mesosphere/docker-containers/tree/master/mesos-slave)
was unable to initialize docker containerizer because of cgroups, this one can do it.

## Running

Note that you should never add prefix `mesos` to the name of your contaier,
otherwise mesos-slave will kill itself, your grandma and probably burn your house.

This container requires you to run in in *privileged mode* to mount cgroups.

This container also wants `--net=host`, but maybe you could run it
with usual `bridge` with some extra port exposures.

Note that this containers does not include docker client, but it is
required to enable docker containerized. Mount docker from host system!

Okay, here comes the command to run the whole thing:

```
docker run -d --privileged=true --net=host \
  -v /usr/bin/docker:/usr/bin/docker:ro \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /lib64/libdevmapper.so.1.02:/lib/libdevmapper.so.1.02:ro \
  --name=whatever-but-without-mesos-prefix-please-i-told-you \
  bobrik/mesos-slave:0.20.0 --containerizers=docker --hostname=web123 \
  --ip=192.168.0.123 --master=zk://web345:2181/mesos \
  --work_dir=/var/lib/mesos/slave --log_dir=/var/log/mesos/slave
```

Add more bind-mounts to persist some state and keep some logs.
