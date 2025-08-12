FROM gitpod/workspace-full

# Install Flutter
RUN sudo apt-get update && sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa openjdk-17-jdk && \
    git clone https://github.com/flutter/flutter.git /home/gitpod/flutter && \
    /home/gitpod/flutter/bin/flutter channel stable && \
    /home/gitpod/flutter/bin/flutter upgrade

ENV PATH="/home/gitpod/flutter/bin:/home/gitpod/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Install Android SDK
ENV ANDROID_SDK_ROOT="/home/gitpod/android-sdk"
RUN mkdir -p $ANDROID_SDK_ROOT && \
    curl -o sdk-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip && \
    unzip sdk-tools.zip -d $ANDROID_SDK_ROOT/cmdline-tools && \
    rm sdk-tools.zip && \
    mv $ANDROID_SDK_ROOT/cmdline-tools $ANDROID_SDK_ROOT/cmdline-tools/latest && \
    yes | $ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager --licenses && \
    $ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.2"

ENV PATH="${PATH}:${ANDROID_SDK_ROOT}/platform-tools"
