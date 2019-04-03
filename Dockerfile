FROM quay.io/digitalpatterns/jdk:latest

USER root
RUN apk add gcompat ncurses5-libs
RUN ln -s /usr/lib/libncurses.so.5 /usr/lib/libtinfo.so.5
ENV ANDROID_HOME=/usr/android

RUN mkdir ${ANDROID_HOME} &&\
    wget -O ${ANDROID_HOME}/android-sdk.zip -q https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip && \
    unzip -d ${ANDROID_HOME} ${ANDROID_HOME}/android-sdk.zip && \
    rm ${ANDROID_HOME}/android-sdk.zip

ENV PATH ${PATH}:${ANDROID_HOME}/tools/bin

RUN yes | sdkmanager "platforms;android-28" "build-tools;27.0.3"

WORKDIR /usr/appsrc

ENTRYPOINT ["/bin/run.sh"]
CMD ["echo", "foo"]
