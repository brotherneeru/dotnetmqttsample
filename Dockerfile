# syntax=docker/dockerfile:1.4

FROM mcr.microsoft.com/dotnet/runtime:7.0-alpine

ARG EXE_DIR=.

ENV MODULE_NAME "SampleDotnetMqtt.dll"

WORKDIR /app

COPY $EXE_DIR/ ./

# Add an unprivileged user account for running the module
RUN adduser -Ds /bin/sh moduleuser 
USER moduleuser

CMD echo "$(date --utc +"[%Y-%m-%d %H:%M:%S %:z]"): Starting Module" && \
    exec /usr/bin/dotnet SampleDotnetMqtt.dll