FROM jupyter/datascience-notebook
USER root
LABEL maintainer="Naoya Ikeda <n_ikeda@hotmail.com>"
COPY azcopy_linux_amd64_10.2.1/azcopy /usr/local/bin
RUN echo "now building..." && \
    cd /root && \
    apt update && \
    apt install -y vim openjdk-11-jdk libv8-3.14-dev libxml2-dev libcurl4-openssl-dev libssl-dev && \
    conda update -n base -c defaults conda -y && \
    conda install python=3.6 rise pyodbc -y && \
    jupyter-nbextension install rise --py --sys-prefix && \
    jupyter-nbextension enable rise --py --sys-prefix && \
    conda install -c h2oai h2o && \
    conda install -c conda-forge xgboost lightgbm fbprophet lime shap && \
    conda install -c r rpy2 r-survival r-ggplot2 r-ggextra && \
    conda install -c conda-forge r-bh r-odbc r-reticulate r-prophet r-xgboost r-lightgbm r-ggally r-v8 r-rcpp r-fitdistrplus r-bnlearn r-rstanarm && \
    pip install optuna

