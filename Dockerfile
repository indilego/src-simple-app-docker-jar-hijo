FROM poc-entorno-desarrollo-1/src-simple-app-docker-jar-padre

#RUN cd /opt/app-root/src/git/
RUN ls -ltra .
RUN ls -ltra ./git
RUN ls -ltra /opt/app-root/src/git/
RUN cd /opt/app-root/src/git
RUN pwd
RUN ls -ltra .
RUN git pull https://github.com/indilego/src-simple-app-docker-jar-hijo.git .
RUN ls -ltra /opt/app-root/src/git/
#RUN cp -R /myapp/* /opt/app-root/src/
RUN chown -R 1001:0 /opt/app-root/src/  
USER 1001 

ENTRYPOINT ["java","-jar","/opt/app-root/src/git/target/app.jar"]
