FROM openshift/base-centos7

EXPOSE 8080

LABEL io.k8s.description="Platform for building and running Spring Boot applications" \
      io.k8s.display-name="Spring Boot Maven 3" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,java,java8,maven,maven3,springboot"

RUN yum update -y && \
  yum install -y curl && \
  yum install -y java-$JAVA_VERSON-openjdk java-$JAVA_VERSON-openjdk-devel && \
  yum clean all

ENV JAVA_HOME /usr/lib/jvm/java

RUN git clone https://github.com/indilego/src-simple-app-docker-jar.git /myapp/
RUN cp -R /myapp/target/* /opt/app-root/src/target
RUN chown -R 1001:0 /opt/app-root
USER 1001

ENTRYPOINT ["java","-jar","src/target/app.jar"]
