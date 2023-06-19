FROM amazoncorretto:11-alpine-jdk

COPY ./target/*.jar /app/api-error.jar
COPY ./otel-agent/*.jar /app/otel-agent/otel-agent.jar
COPY ./otel-agent/otel-config.yaml /app/otel-agent/otel-config.yaml

ENV OTEL_EXPORTER_OTLP_ENDPOINT=http://collector:4317
ENV OTEL_LOGS_EXPORTER=none
ENV OTEL_METRICS_EXPORTER=none
#ENV OTEL_LOGS_EXPORTER=otlp
ENV OTEL_RESOURCE_ATTRIBUTES=service.name=api-error

WORKDIR /app

CMD ["java", "-javaagent:/app/otel-agent/otel-agent.jar", "-jar", "api-error.jar"]
