FROM mesosphere/mesos:0.20.0
MAINTAINER Ian Babrou <ibobrik@gmail.com>

ADD ./run.sh /run.sh
ENTRYPOINT ["/run.sh"]
