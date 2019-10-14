# docker-mult-stage-build

Multi-stage builds are a new feature requiring Docker 17.05 or higher on the daemon and client. Multistage builds are useful to anyone who has struggled to optimize Dockerfiles while keeping them easy to read and maintain.

## build in dev

```bash
docker build --target dev -t python-app:dev .
```

## run in dev

```bash
docker run -d --name app-dev -v "$(pwd)/:/app/" -p 80:8000 python-app:dev
```

## build in prod

```bash
docker build --target prod -t python-app:prod .
```

## run in prod

```bash
docker run --rm -d --name app -p 80:8000 python-app:prod
```


### references:

- [Use multi-stage builds](https://docs.docker.com/develop/develop-images/multistage-build)
- [Builder pattern vs. Multi-stage builds in Docker](https://blog.alexellis.io/mutli-stage-docker-builds/)
- [Slimming Down Your Docker Images](https://towardsdatascience.com/slimming-down-your-docker-images-275f0ca9337e)
