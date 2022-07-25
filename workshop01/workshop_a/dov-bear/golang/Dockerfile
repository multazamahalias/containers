ARG GOLANG_VERSION="1.18-alpine3.16"
ARG ALPINE_VERSION="3.16"

FROM golang:${GOLANG_VERSION} AS builder
WORKDIR /app

# where possible, try to arrange where the path that change less is added first
ADD go.mod .
ADD go.sum .
ADD main.go .

# build the application
# /app/main
RUN go build -o main .

# deployment container
FROM alpine:${ALPINE_VERSION}

# install curl
RUN apk --no-cache add curl

WORKDIR /app
# copy binary from builder
COPY --from=builder /app/main /app/main
ADD public public
ADD templates templates

# default user is root
USER 1000
ENV ENV_PORT=5000
EXPOSE ${ENV_PORT}