FROM gitpod/workspace-full

ARG CONFLUENT_VERSION_SHORT=7.2
ARG CONFLUENT_VERSION=${CONFLUENT_VERSION_SHORT}.1

ENV CONFLUENT_HOME=/home/gitpod/confluent-${CONFLUENT_VERSION}
SHELL ["/bin/bash", "-c"]

# Enable bash completion and update PATH in bash profile
RUN mkdir -p ~/.local/share/bash-completion/ && \
    echo "source ~/.local/share/bash-completion/confluent" >> ~/.bashrc && \
    echo "export PATH=/home/gitpod/.sdkman/candidates/java/current/bin:/home/gitpod/confluent-${CONFLUENT_VERSION}/bin:$PATH" >> ~/.bashrc

# Install Confluent Platform
RUN curl -O https://packages.confluent.io/archive/${CONFLUENT_VERSION_SHORT}/confluent-${CONFLUENT_VERSION}.zip && \
    unzip confluent-${CONFLUENT_VERSION}.zip

# Enable bash tab completion.
RUN /home/gitpod/confluent-${CONFLUENT_VERSION}/bin/confluent completion bash > ~/.local/share/bash-completion/confluent

ENV PATH=/home/gitpod/.sdkman/candidates/java/current/bin:/home/gitpod/confluent-${CONFLUENT_VERSION}/bin:$PATH

# Install datagen connector
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-datagen:0.5.3
