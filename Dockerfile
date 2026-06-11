FROM                docker.io/library/node:22 As builder
WORKDIR             /app
COPY               ./  /app/
RUN                npm ci && npm run build

FROM              docker.io/library/nginx
COPY              --from=builder /app/dist/*  /usr/share/nginx/html
