FROM state/oraclejre:1.8.0_40

ENV PROJECT_VERSION kafka-manager-1.0-SNAPSHOT1

ADD target/universal/$PROJECT_VERSION.zip /tmp/

RUN yum install -y unzip && \
    cd /tmp && \
    unzip $PROJECT_VERSION.zip && \
    mv /tmp/$PROJECT_VERSION/* /srv

WORKDIR /srv

CMD ["/srv/bin/kafka-manager"]
