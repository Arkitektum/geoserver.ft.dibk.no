
FROM debian:trixie-slim

ARG STYLES_REPO_NAME=styles.ft.dibk.no
ARG STYLES_REPO_DIRS

WORKDIR /styles

RUN apt -y update \
    && apt -y install git gettext \
    && git clone --no-checkout https://github.com/Arkitektum/${STYLES_REPO_NAME}.git \
    && cd styles.ft.dibk.no \
    && git sparse-checkout init --cone \
    && git sparse-checkout set ${STYLES_REPO_DIRS} \
    && git checkout main \
    && cd .. \
    && mv ./${STYLES_REPO_NAME}/* . \
    && rm -r ./${STYLES_REPO_NAME}
