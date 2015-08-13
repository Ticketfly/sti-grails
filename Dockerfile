# grails
FROM openshift/base-centos7

MAINTAINER Patrick Tescher <patrickt@ticketfly.com>

LABEL io.k8s.description="Platform for grails apps" \
      io.k8s.display-name="grails" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,grails"

RUN yum install -y java-1.8.0-openjdk && yum clean all -y

COPY ./.sti/bin/ /usr/local/sti

RUN mkdir /opt/openshift; chown -R 1001:1001 /opt/openshift

USER 1001

EXPOSE 8080

CMD ["usage"]
