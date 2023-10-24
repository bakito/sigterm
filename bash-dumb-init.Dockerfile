FROM golang:1.21-bullseye as builder

WORKDIR /build

ARG VERSION=main
RUN apt-get update && apt-get install -y upx

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64
COPY . .

RUN go build -a -installsuffix cgo -ldflags="-w -s" -o run-me && \
    upx -q run-me

FROM alpine
RUN apk add --no-cache bash dumb-init
COPY bash.sh /app/
COPY --from=builder /build/run-me /app/
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/bin/bash", "-c", "/app/bash.sh"]
USER 1001
