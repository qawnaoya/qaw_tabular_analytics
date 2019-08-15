FROM jupyter/datascience-notebook
USER root
LABEL maintainer="Naoya Ikeda <n_ikeda@hotmail.com>"
COPY azcopy_linux_amd64_10.2.1/azcopy /usr/local/bin
RUN echo "now building..." && \
    cd /root && \
    apt update && \
    apt install -y vim && \
    conda update -n base -c defaults conda -y && \
    conda install rise -y && \
    jupyter-nbextension install rise --py --sys-prefix && \
    jupyter-nbextension enable rise --py --sys-prefix && \
    conda install -c h2oai h2o

