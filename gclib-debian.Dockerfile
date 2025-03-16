# podman build --platform=linux/amd64 -t native-image-demo-debian:latest -f gclib-debian.Dockerfile .

# Stage 1: Build environment
FROM ghcr.io/graalvm/native-image-community:23.0.2 AS build-stage
WORKDIR /app

# Properties
COPY .mvn/ .mvn

# Wrapper and pom
COPY mvnw pom.xml ./
RUN chmod +x mvnw

# Download Dependencies
RUN ./mvnw dependency:resolve

# Copy Souce Files to Container
COPY src ./src

RUN ./mvnw -Pnative native:compile -DskipTests

# Stage 2: Runtime image
FROM amd64/debian:latest
WORKDIR /app
COPY --from=build-stage /app/target/NativeImageDemo /app/target/*.so ./
EXPOSE 8080
ENTRYPOINT ["/app/NativeImageDemo"]