FROM alpine AS build

ENV GRPCWEB_VER 0.6.3

RUN apk --update add curl

RUN curl -s -O -L https://github.com/improbable-eng/grpc-web/releases/download/${GRPCWEB_VER}/grpcwebproxy-${GRPCWEB_VER}-linux-x86_64 && \
    mv grpcwebproxy-${GRPCWEB_VER}-linux-x86_64 /grpcwebproxy && \
    chmod +x /grpcwebproxy

FROM scratch

COPY --from=build /grpcwebproxy /grpcwebproxy

ENTRYPOINT ["/grpcwebproxy"]