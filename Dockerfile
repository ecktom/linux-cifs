FROM ubuntu:bionic

# bootstrap dependencies
RUN apt-get update && apt-get install -y \
        cifs-utils \
    && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
