FROM golang:1.22-bookworm AS builder

RUN CGO_ENABLED=1 go install -tags extended github.com/gohugoio/hugo@v0.126.1

FROM debian:12 AS final

COPY --from=builder /go/bin/hugo /usr/local/bin/hugo

CMD [ "bash" ]