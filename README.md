# Docker PrestoSQL Cluster

## Build image

```
$ make build

# make push
```

## Launch presto

Presto cluster can be launched by using docker-compose.

```
$ make run
```

## docker-compose.yml

Images are uploaded in [DockerHub](https://hub.docker.com/). These images are build with the corresponding version of Presto. 
`command` is required to pass node id information which must be unique in a cluster.

```
version: '3'

services:
  coordinator:
    image: chethanuk/presto-coordinator:307-SNAPSHOT
    ports:
      - "8080:8080"
    container_name: "coordinator"
    command: coordinator
  worker0:
    image: chethanuk/presto-worker:307-SNAPSHOT
    container_name: "worker0"
    ports:
      - "8081:8081"
    command: worker0
  worker1:
    image: chethanuk/presto-worker:307-SNAPSHOT
    container_name: "worker1"
    ports:
      - "8082:8081"
    command: worker1
```

Run

```
$ docker-compose up -d
```

# Contact the awesome Presto community to learn more about PrestoSQL

User Mailing List: [presto-users](https://groups.google.com/group/presto-users)
Users & Development Slack: [prestosql.slack.com](https://join.slack.com/t/prestosql/shared_invite/enQtNTMyNzU2NzQ1NzQ4LWRhMTE4ZTA4NjM0NDA1NmFkZjEyZDJmN2MxNGY1ZTk4NmM4MzMxZDk4OGQ0NjZhNmQxMWUyNGIxMDliODk0MmU) 
Twitter: @prestosql #prestosql #prestodb
YouTube: Presto Channel


# Credits to Kai for his Awesome Work!.

I have upload in my docker hub for my personal testing of prestosql.io