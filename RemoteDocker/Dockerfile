FROM ubuntu:latest AS ubuntu
LABEL authors="pmrjge"

WORKDIR /workspace
USER root

ENV CONDA_DIR=/miniconda3

RUN apt-get update && apt-get install apt-utils && apt-get install -y git wget curl nginx openssh-server gcc g++ build-essential cmake && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh

RUN bash /tmp/miniconda.sh -b -p $CONDA_DIR

ENV PATH="$CONDA_DIR/bin:$PATH"

RUN $CONDA_DIR/bin/conda init bash

SHELL ["/bin/bash", "-i", "-c"]

RUN rm -rf /tmp/miniconda.sh

RUN conda tos accept

RUN conda create -n pt python=3.13 -y
RUN conda create -n jax python=3.13 -y

ADD install.sh /install.sh

RUN chmod +x /install.sh

RUN /install.sh

RUN conda run -n pt jupyter lab --generate-config

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

ENV PATH="/root/.cargo/bin:${PATH}"

VOLUME ["/workspace"]

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication no/PasswordAuthentication no/' /etc/ssh/sshd_config

RUN mkdir /var/run/sshd && chmod 0755 /var/run/sshd

ADD start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 8888 22 80
ENTRYPOINT ["/start.sh"]
