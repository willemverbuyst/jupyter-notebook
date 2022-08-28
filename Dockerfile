FROM node:10-alpine

RUN apk add --update-cache alpine-sdk \
    python3-dev \
    python-dev \
    libffi-dev \
    py-pip

RUN python3 -m pip install --upgrade pip

RUN python3 -m pip install jupyterlab && \
    jupyter serverextension enable --py jupyterlab

RUN npm --unsafe-perm i -g ijavascript && \
    ijsinstall --install=global

ENV HOME /project/notebooks

ENV PORT 8888

WORKDIR /project

COPY ./notebooks /project/notebooks

EXPOSE $PORT

USER root

CMD jupyter notebook --ip=0.0.0.0 --port=$PORT --no-browser --notebook-dir=$HOME --allow-root