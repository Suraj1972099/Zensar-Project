FROM node:16

ENV UID=${UID:-"483228"} \
    USER=${USER:-"suraj"} \
    GID=${GID:-"16789"} \
    GROUP_NAME=${GROUP_NAME:-"surajid"}

RUN groupadd -g  ${GID} ${GROUP_NAME} \
    && useradd -m -u ${UID}  -g ${GID} -d /home/${USER} -s /bin/sh ${USER}

WORKDIR /home/${USER}/app

COPY ./Zensar-Project  /home/${USER}/app

RUN yarn install

RUN chown -R ${USER}:${GROUP_NAME} /home/${USER}
USER ${UID}
ENTRYPOINT ["yarn", "run", "serve", "--build"]