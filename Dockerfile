FROM jupyter/minimal-notebook

ENV HOME /project/notebooks

ENV PORT 8888

WORKDIR /project

COPY ./notebooks /project/notebooks

EXPOSE $PORT

USER root

CMD jupyter notebook --ip=0.0.0.0 --port=$PORT --no-browser --notebook-dir=$HOME --allow-root