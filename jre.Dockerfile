#podman build --platform=linux/amd64 -t native-image-demo-jre:latest -f jre.Dockerfile .

FROM eclipse-temurin:23-ubi9-minimal as build-stage

WORKDIR /app

COPY .mvn/ .mvn

COPY mvnw pom.xml ./
RUN chmod +x mvnw

RUN ./mvnw dependency:resolve

COPY src ./src
RUN ./mvnw package

FROM eclipse-temurin:23-jre-ubi9-minimal
WORKDIR /app
COPY --from=build-stage /app/target/NativeImageDemo-0.0.1-SNAPSHOT.jar .
EXPOSE 8080
CMD ["java", "-jar", "/app/NativeImageDemo-0.0.1-SNAPSHOT.jar"]
