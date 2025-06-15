FROM debian:bookworm-slim

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y curl npm &&  apt-get autoremove -y && apt-get clean -y && \
    npm install -g supergateway

EXPOSE 8000

ENTRYPOINT ["supergateway"]

CMD ["--help"]
