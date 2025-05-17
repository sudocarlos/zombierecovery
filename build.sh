#!/usr/bin/env bash

docker run -t -d --name gobuilder golang
docker exec gobuilder git clone https://github.com/lightninglabs/chantools.git
docker exec -w /go/chantools gobuilder git checkout zombierecovery-cln 
docker exec -w /go/chantools gobuilder make install
docker cp gobuilder:/go/bin/chantools .
docker stop gobuilder
docker rm gobuilder
