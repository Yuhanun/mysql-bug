FROM rust:1.64.0-alpine3.16 as builder

RUN apk add \
    mysql==10.6.9-r0 \
    mariadb-connector-c-dev==3.1.13-r4 \
    build-base

RUN cargo new app --bin
COPY Cargo.toml /app/Cargo.toml

WORKDIR /app

COPY ./src /app/src
RUN cargo build --release

ENV RUST_BACKTRACE full
ENTRYPOINT [ "/app/target/release/mre" ]