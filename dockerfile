FROM python:3.11.4-bullseye

SHELL ["/bin/bash", "-c"]

ENV FW_CONFIG_FILE=/root/config

RUN pip install lucidwallet==0.2.1

# hack until cpu fix gets merged
# COPY core.py /usr/local/lib/python3.11/site-packages/aiosqlite/

RUN mkdir /database

RUN echo $' \n\
    [locations]\n\
    database_dir=/database' > /root/config

CMD ["lucidwallet"]