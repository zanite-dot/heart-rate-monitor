FROM gitpod/workspace-full

# Install Flutter
RUN sudo apt-get update && sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa && \
    git clone https://github.com/flutter/flutter.git -b stable /home/gitpod/flutter && \
    echo 'export PATH="$PATH:/home/gitpod/flutter/bin"' >> /home/gitpod/.bashrc

ENV PATH="/home/gitpod/flutter/bin:${PATH}"
