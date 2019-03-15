# image: ohze/flutter
FROM cirrusci/flutter:base

ENV FLUTTER_VERSION "1.3.10"
ENV FLUTTER_HOME $HOME/sdks/flutter
ENV FLUTTER_ROOT $FLUTTER_HOME
ENV PATH $PATH:$FLUTTER_HOME/bin:$FLUTTER_HOME/bin/cache/dart-sdk/bin

RUN git clone -b v$FLUTTER_VERSION https://github.com/flutter/flutter.git $FLUTTER_HOME

# update fastlane. -N mean no document,
# && run flutter doctor to download dependencies and precompile things
RUN sudo gem install fastlane -NV \
    && flutter doctor -v
