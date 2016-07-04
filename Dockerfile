FROM poc-entorno-desarrollo-1/src-simple-app-docker-jar-padre

RUN  cd /opt/app-root/src/git/ && git fetch .
RUN chown -R 1001:0 /opt/app-root/src/  
USER 1001 

ENTRYPOINT ["java","-jar","/opt/app-root/src/git/target/app.jar"]
