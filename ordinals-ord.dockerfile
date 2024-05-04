FROM rust:1.76.0-slim-bullseye AS builder

WORKDIR /build

RUN apt-get update
RUN apt-get install -y git openssl pkg-config libssl-dev

RUN git clone --branch 0.18.4 https://github.com/joundy/ordinals-ord .

RUN cargo install --locked --path .

FROM debian:bullseye-slim

WORKDIR /data

RUN apt-get update
RUN apt-get install -y curl

COPY --from=builder /usr/local/cargo/bin/ord /bin/ord

EXPOSE 3032

STOPSIGNAL SIGINT

ENTRYPOINT ["ord"]
