# template-confluent-cli
Template repo for a lab environment with confluent and ccloud CLIs installed. This is meant to provide a minimal, 0-setup, 1-click experience with Confluent.

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/chuck-confluent/template-confluent-cli)

## Features

- Uses Gitpod's default "workspace-full" ubuntu workspace, which includes [a lot of stuff](https://github.com/gitpod-io/workspace-images/blob/master/full/Dockerfile)
  - We could probably slim the image by customizing on top of gitpod/workspace-base. This would decrease image pull time.
- confluent and ccloud CLIs installed, in PATH, with autocompletion
- Confluent Platform installed at /home/gitpod/confluent-${CONFLUENT_VERSION}, with all binaries in PATH (e.g. kafka-console-producer, perf tests, kafka-cluster-links, etc)
- On launch, `confluent local services start` starts all confluent services
- On launch, two datagen source connectors are automatically started

What other features would you like to see? File an issue or make a pull request.
