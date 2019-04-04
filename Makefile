PRESTO_VERSION := 307

build:
	docker build --build-arg VERSION=${PRESTO_VERSION} -t chethanuk/presto-base:${PRESTO_VERSION} presto-base
	docker build --build-arg VERSION=${PRESTO_VERSION} -t chethanuk/presto-coordinator:${PRESTO_VERSION} presto-coordinator
	docker build --build-arg VERSION=${PRESTO_VERSION} -t chethanuk/presto-worker:${PRESTO_VERSION} presto-worker
	docker-compose build

local:
	docker build --build-arg VERSION=${PRESTO_SNAPSHOT_VERSION} -f presto-base/Dockerfile-dev -t chethanuk/presto-base:${PRESTO_SNAPSHOT_VERSION} presto-base
	docker build --build-arg VERSION=${PRESTO_SNAPSHOT_VERSION} -t chethanuk/presto-coordinator:${PRESTO_SNAPSHOT_VERSION} presto-coordinator
	docker build --build-arg VERSION=${PRESTO_SNAPSHOT_VERSION} -t chethanuk/presto-worker:${PRESTO_SNAPSHOT_VERSION} presto-worker	

.PHONY: test clean

push: build
	docker push chethanuk/presto-base:$(PRESTO_VERSION)
	docker push chethanuk/presto-coordinator:$(PRESTO_VERSION)
	docker push chethanuk/presto-worker:$(PRESTO_VERSION)

run:
	docker-compose up -d
	echo "Please check http://localhost:8080"

down:
	docker-compose down
