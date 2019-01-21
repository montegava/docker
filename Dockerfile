# Base image for .net core project
# supported by devOps
# triggered by registry hub. Shoud create tag with name arvi/dotnet:latest + arvi/dotnet:latest

FROM microsoft/dotnet:2.2-sdk-alpine

# install bash
RUN apk add --no-cache bash

# install coverlet
RUN dotnet tool install --global coverlet.console

# add entrypoint script
ADD entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# run entrypoint script
ENTRYPOINT ["entrypoint.sh"]

LABEL application=docker