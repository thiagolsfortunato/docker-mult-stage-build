FROM python:3.7-alpine as base

LABEL maintainer="thiagolsfortunato@hotmail.com"

# WORKDIR APP
WORKDIR /app

# UPDATE AND INSTALL CURL
RUN apk --update --no-cache add curl

FROM base as build

# INSTALL DEPENDENCIES
RUN mkdir /install
COPY requirements.txt /install/
RUN pip install --install-option="--prefix=/install" -r /install/requirements.txt 

FROM base as dev

# COPY DEPENDENCIES INSTALLED
COPY --from=build /install /usr/local

## COPY APP
COPY . /app/

## COMMAND
CMD ["python", "app.py"]

FROM base as prod

# CREATE USER APP 
RUN addgroup -S app && \
    adduser -S -G app app && \
    chown -R app:app /app

# COPY DEPENDENCIES INSTALLED
COPY --from=build /install /usr/local

# COPY APP
COPY app.py /app/

# EXPORT PORT APPLICATION
EXPOSE 8000

USER app

# COMMAND
CMD [ "python", "app.py" ]"