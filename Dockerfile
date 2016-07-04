FROM poc-entorno-desarrollo-1/src-simple-app-docker-jar-padre

RUN cd /opt/app-root/src/git/git/
RUN ls -ltra

RUN git pull https://github.com/indilego/src-simple-app-docker-jar-hijo.git . 
#RUN cp -R /myapp/* /opt/app-root/src/
RUN chown -R 1001:0 /opt/app-root/git/git  
USER 1001 

ENTRYPOINT ["java","-jar","/opt/app-root/src/git/git/target/app.jar"]
