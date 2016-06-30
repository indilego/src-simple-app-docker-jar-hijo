# springboot-maven3-centos
#
# This image provide a base for running Spring Boot based applications. It
# provides a base Java 8 installation and Maven 3.

FROM poc-entorno-desarrollo-1/src-simple-app-docker-multilayer-image

RUN git clone https://github.com/indilego/src-simple-app-docker.git /myapp/
RUN cp -R /myapp/* /opt/app-root/src
RUN chown -R 1001:0 /opt/app-root
USER 1001

RUN  mvn clean install -Dmaven.test.skip=true
ENTRYPOINT ["java","-jar","target/app.jar"]
