# docker-mult-stage-build

Multi-stage builds are a new feature requiring Docker 17.05 or higher on the daemon and client. Multistage builds are useful to anyone who has struggled to optimize Dockerfiles while keeping them easy to read and maintain.

### build in dev

```bash
docker build --target dev -t python-app:dev .
```

### build in prod

```bash
docker build --target prod -t python-app:prod .
```

## Docker Build Kit

```bash

```

### references:

- [Use multi-stage builds](https://docs.docker.com/develop/develop-images/multistage-build)
- [Builder pattern vs. Multi-stage builds in Docker](https://blog.alexellis.io/mutli-stage-docker-builds/)
- [Slimming Down Your Docker Images](https://towardsdatascience.com/slimming-down-your-docker-images-275f0ca9337e)
- [Docker Build Kit](https://docs.docker.com/develop/develop-images/build_enhancements/)
- [Docker build](https://docs.docker.com/engine/reference/commandline/build/)
