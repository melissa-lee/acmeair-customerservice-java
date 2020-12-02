FROM openliberty/open-liberty:latest

# Config
COPY --chown=1001:0 src/main/liberty/config/server.xml /config/server.xml
COPY --chown=1001:0 src/main/liberty/config/server.env /config/server.env
COPY --chown=1001:0 src/main/liberty/config/jvm.options /config/jvm.options
COPY --chown=1001:0 src/main/liberty/config/bootstrap.properties /config/bootstrap.properties

# App
COPY --chown=1001:0 src/main/liberty/config /config/
COPY --chown=1001:0 target/acmeair-customerservice-java-4.0.war /config/apps/

# Logging vars
ENV LOGGING_FORMAT=json
ENV ACCESS_LOGGING_ENABLED=false
ENV TRACE_SPEC=*=info

RUN configure.sh

