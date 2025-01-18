# zombierecovery

Compiled from https://github.com/lightninglabs/chantools

Commands used to build chantool binary from lightninglabs/chantools (branch zombierecovery-cln)

```
git pull https://github.com/lightninglabs/chantools.git
cd chantools
git checkout zombierecover-cln
docker run -it --name go golang
> exit   # exit from container
docker start go   # start the stopped container
docker cp . go:/go/chantools/  # copy the repo to the container
docker exec -it go bash
> cd chantools   # in the container
> make install   # create the binary
> exit           # exit the container
docker cp go:/bin/chantools .   # copy the compiled binary out of the container
```

