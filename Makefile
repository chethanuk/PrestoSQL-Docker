PRESTO_VERSION := 312

local:
	docker build --build-arg VERSION=${PRESTO_VERSION} -t prestosql/presto-coordinator:${PRESTO_VERSION} presto-coordinator
	docker build --build-arg VERSION=${PRESTO_VERSION} -t prestosql/presto-worker:${PRESTO_VERSION} presto-worker	

.PHONY: test clean

run:
	docker-compose up -d
	echo "Please check http://localhost:8080"

down:
	docker-compose down
