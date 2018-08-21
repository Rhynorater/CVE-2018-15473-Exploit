FROM alpine:edge
LABEL maintainer "Ilya Glotov <ilya@ilyaglotov.com>"

RUN apk add --update --no-cache --virtual .deps build-base \
                                                libffi-dev \
                                                py-pip \
                                                python-dev \
  && apk add --no-cache openssl-dev \
                        python \
  && pip install paramiko \
  && apk del .deps

COPY sshUsernameEnumExploit.py /sshUsernameEnumExploit.py

RUN chmod +x /sshUsernameEnumExploit.py

ENTRYPOINT ["python", "sshUsernameEnumExploit.py"]
