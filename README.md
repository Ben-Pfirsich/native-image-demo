# Native Spring Boot Demo

## Setup for local build
- Install GraalVM 23
- For windows install Visual Studio C++ Compiler (see GraalVM Docs)
- For linux install gcc glibc-devel zlib-devel libstdc++-static
- run command `./mvnw -Pnative native:compile -DskipTests` to build native executable

### Image Sizes of different build approaches:
![img.png](sizes-of-images.png)