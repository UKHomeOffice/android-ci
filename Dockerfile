FROM quay.io/ukhomeofficedigital/openjdk8:latest

USER root
ENV ANDROID_HOME=/usr/android

RUN yum install -y unzip

RUN mkdir ${ANDROID_HOME} &&\
    curl -o ${ANDROID_HOME}/android-sdk.zip -s https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip && \
    unzip -d ${ANDROID_HOME} ${ANDROID_HOME}/android-sdk.zip && \
    rm ${ANDROID_HOME}/android-sdk.zip

ENV PATH ${PATH}:${ANDROID_HOME}/tools/bin

RUN yes | sdkmanager "platforms;android-28" "build-tools;27.0.3"

WORKDIR /usr/appsrc

ENTRYPOINT ["/bin/run.sh"]
CMD ["echo", "foo"]
