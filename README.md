# Dockerfile for Supergateway using Debian Bookworm Slim

This project is for creation of the Docker images for [supercorp-ai/supergateway](https://github.com/supercorp-ai/supergateway) using Debian Bookworm Slim as the base image.

I have created this fork because the official `supergateway:uvx` image does not work with some of the MCP servers that use the `playwright` Python module. The root cause is that `uvx` cannot install `playwright` due to the platform tag of Alpine is not supported by the `playwright` module.

## How to use

1. Clone the repository:

```bash
git clone https://github.com/alexeygumirov/supergateway-docker-debian.git
```

2. Build base Docker image locally:

```bash
cd supergateway-docker-debian
docker build -f docker/base.Dockerfile -t supergateway-debian:latest .
docker build -f docker/deno.Dockerfile -t supergateway-debian:deno .
docker build -f docker/uvx.Dockerfile -t supergateway-debian:uvx .
```

3. Usage

Use the `supergateway-debian:uvx` image as described in the [Supergateway README: Images with dependencies](https://github.com/supercorp-ai/supergateway/blob/main/README.md#images-with-dependencies) section. Instead of `supercorp/supergateway:uvx`, use `supergateway-debian:uvx`.

* uvx Supergateway + uv/uvx, so you can call uvx directly:

```bash
docker run -it --rm -p 8000:8000 supergateway-debian:uvx \
  --stdio "uvx mcp-server-fetch"
```

* deno Supergateway + Deno, ready to run Deno-based MCP servers:

```bash
docker run -it --rm -p 8000:8000 supergateway-debian:deno \
  --stdio "deno run -A jsr:@omedia/mcp-server-drupal --drupal-url https://your-drupal-server.com"
```

# License

MIT License
