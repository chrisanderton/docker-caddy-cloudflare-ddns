FROM caddy:${CADDY_VERSION:-2.7.6}-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@latest \
    --with github.com/mholt/caddy-dynamicdns

FROM caddy:${CADDY_VERSION:-2.7.6}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
