ARG VERSION=3.11.4

FROM python:$VERSION-bullseye AS compile-image

RUN apt-get update

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN pip install lucidwallet==0.2.18

FROM python:$VERSION-slim-bullseye AS build-image

ARG VERSION

SHELL ["/bin/bash", "-c"]

COPY --from=compile-image /opt/venv /opt/venv

# hack until cpu fix gets merged
COPY core.py /opt/venv/lib/python$VERSION/site-packages/aiosqlite/

RUN mkdir /database

RUN echo $' \n\
    [locations]\n\
    database_dir=/database' > /root/config

ENV FW_CONFIG_FILE=/root/config
ENV PATH="/opt/venv/bin:$PATH"
CMD ["lucidwallet"]