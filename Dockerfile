FROM jupyter/datascience-notebook
USER root
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
LABEL maintainer="Naoya Ikeda <n_ikeda@hotmail.com>"
COPY azcopy_linux_amd64_10.2.1/azcopy /usr/local/bin
RUN echo "now building..." && \
    cd /root && \
    apt update && \
    apt install -y vim && \
    apt install -y openjdk-11-jdk && \
    conda update -n base -c defaults conda -y && \
    conda install python=3.6 && \
    conda install rise -y && \
    jupyter-nbextension install rise --py --sys-prefix && \
    jupyter-nbextension enable rise --py --sys-prefix && \
    conda install -c h2oai h2o

