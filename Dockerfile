FROM alpine
EXPOSE 8083
COPY sparge /bin/
ENTRYPOINT ["/bin/sparge", "start", "-d", "/app", "-p", "8083", "-s", "/app/styles.scss"]
RUN apk --update upgrade && \
    apk add libsass libc6-compat sassc && \
    rm -rf /var/cache/apk/* && \
    cp /usr/lib/libsass.so.1 /usr/lib/libsass.so.0
