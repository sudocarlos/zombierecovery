#!/usr/bin/env bash

docker run -it -d --name gobuilder golang 
docker exec -it gobuilder git clone https://github.com/lightninglabs/chantools.git
docker exec -w /go/chantools -it gobuilder git checkout zombierecovery-cln 
docker exec -w /go/chantools -it gobuilder make install
docker cp gobuilder:/go/bin/chantools .
docker stop gobuilder && docker rm gobuilder
