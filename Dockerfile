FROM rawmind/alpine-jdk8:1.8.181-0

ADD target/my-app-1.0-SNAPSHOT.jar hello.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/hello.jar"]

