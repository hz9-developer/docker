# Build the go application into a binary
FROM maven:openjdk-18 as builder
WORKDIR /app
COPY . ./
RUN mvn clean install && \mvn clean package

FROM openjdk:11.0.16-jdk
COPY --from=builder /app/build/DevOpsUsach2020-0.0.1.jar .
CMD ["/usr/local/Cellar/openjdk/14.0.1/bin/java", "-jar", "DevOpsUsach2020-0.0.1.jar"]
ENV PORT=8081
EXPOSE ${PORT}