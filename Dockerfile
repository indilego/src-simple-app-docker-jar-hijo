FROM poc-entorno-desarrollo-1/src-simple-app-docker-jar-padre

RUN git clone https://github.com/indilego/src-simple-app-docker-jar-padre.git /myapp/
RUN cp -R /myapp/* /opt/app-root/src/
RUN chown -R 1001:0 /opt/app-root
USER 1001

ENTRYPOINT ["java","-jar","/opt/app-root/src/target/app.jar"]
