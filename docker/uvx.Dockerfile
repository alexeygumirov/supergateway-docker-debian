FROM supergateway-debian:latest
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
