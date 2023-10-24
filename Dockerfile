FROM caddy:${CADDY_VERSION:-2.7.5}-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@latest \
    --with github.com/mholt/caddy-dynamicdns

FROM caddy:${CADDY_VERSION:-2.7.5}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
