# docker-mult-stage-build

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
