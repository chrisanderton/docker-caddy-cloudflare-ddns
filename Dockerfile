FROM caddy:${CADDY_VERSION:-2.6.2}-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@latest \
    --with github.com/mholt/caddy-dynamicdns

FROM caddy:${CADDY_VERSION:-2.6.2}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
