FROM gitpod/workspace-full
ARG CONFLUENT_VERSION=6.2.1
ARG CONFLUENT_VERSION_SHORT=6.2

# Install Confluent CLI and Confluent Cloud CLI
RUN $(cd /home/gitpod && curl -O https://packages.confluent.io/archive/${CONFLUENT_VERSION_SHORT}/confluent-${CONFLUENT_VERSION}.zip && unzip confluent-${CONFLUENT_VERSION}.zip) && \
    curl -L --http1.1 https://cnfl.io/ccloud-cli | sudo sh -s -- -b /usr/local/bin && \
    mkdir -p ~/.local/share/bash-completion/ && \
    touch ~/.local/share/bash-completion/ccloud && \
    ccloud completion bash > ~/.local/share/bash-completion/ccloud && \
    touch ~/.local/share/bash-completion/confluent && \
    /home/gitpod/confluent-${CONFLUENT_VERSION}/bin/confluent completion bash > ~/.local/share/bash-completion/confluent && \
    echo "source ~/.local/share/bash-completion/ccloud" >> ~/.bashrc && \
    echo "source ~/.local/share/bash-completion/confluent" >> ~/.bashrc && \
    echo "export PATH=/home/gitpod/confluent-${CONFLUENT_VERSION}/bin:$PATH" >> ~/.bashrc
