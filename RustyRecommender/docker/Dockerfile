FROM nvidia/cuda:13.0.0-cudnn-runtime-ubuntu24.04
LABEL authors="pmrj"

WORKDIR /workspace
USER root

RUN apt-get update && apt-get install apt-utils && apt-get install -y git wget curl nginx openssh-server gcc g++ build-essential cmake python3-dev python3-pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -fsS https://pkgx.sh | sh -s -- -y

RUN pkgx install huggingface-cli

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

ENV PATH="/root/.cargo/bin:${PATH}"

ADD proj.zip /root/proj.zip

RUN unzip /root/proj.zip

RUN cd /root/proj && cargo add luminal && cargo build

ENTRYPOINT ["cd /root/proj && cargo run --release --features cuda"]