# syntax = docker/dockerfile:1.0-experimental
FROM python:3.7-alpine as base

LABEL maintainer="thiagolsfortunato@hotmail.com"

# WORKDIR APP
WORKDIR /app

# UPDATE AND INSTALL CURL
RUN apk update --no-cache

FROM base as build

# INSTALL DEPENDENCIES
RUN mkdir /install
COPY requirements.txt /install/
RUN pip install --install-option="--prefix=/install" -r /install/requirements.txt 

FROM base as dev

RUN apk update --no-cache add curl

EXPOSE 8000

## COMMAND
CMD ["python", "app.py"]

FROM base as prod

# COPY DEPENDENCIES INSTALLED
COPY --from=build /install /usr/local

# CREATE USER APP 
RUN addgroup -S app && \
    adduser -S -G app app && \
    chown -R app:app /app

# COPY APP
COPY app.py /app/

# EXPORT PORT APPLICATION
EXPOSE 8000

USER app

# COMMAND
CMD [ "python", "app.py" ]"