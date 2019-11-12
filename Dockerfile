FROM ui-base-docker:latest

RUN wget https://download.jetbrains.com/go/goland-2019.2.5.tar.gz -O /tmp/goland-2019.2.5.tar.gz && \
    mkdir /app && \
    cd /app && tar -xvf /tmp/goland-2019.2.5.tar.gz && \
    mv "/app/`ls /app`" /app/goland

USER andrei

CMD ["/bin/bash", "--login", "/app/goland/bin/goland.sh"]
