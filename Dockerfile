FROM jupyter/datascience-notebook
USER root
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
LABEL maintainer="Naoya Ikeda <n_ikeda@hotmail.com>"
COPY azcopy_linux_amd64_10.2.1/azcopy /usr/local/bin
RUN echo "now building..." && \
    cd /root && \
    apt update && \
    apt install -y vim openjdk-11-jdk libv8-dev && \
    conda update -n base -c defaults conda -y && \
    conda install python=3.6 rise pyodbc -y && \
    jupyter-nbextension install rise --py --sys-prefix && \
    jupyter-nbextension enable rise --py --sys-prefix && \
    conda install -c h2oai h2o && \
    conda install -c conda-forge xgboost lightgbm fbprophet && \
    conda install -c r rpy2 r-survival r-ggplot2 r-ggextra && \
    conda install -c conda-forge r-odbc r-reticulate r-prophet r-xgboost r-lightgbm r-ggally && \
    R -e "install.packages('h2o',dependencies=TRUE, repos='http://cran.rstudio.com/')" && \
    R -e "install.packages('BiocManager',dependencies=TRUE, repos='http://cran.rstudio.com/')" && \
    R -e "BiocManager::install(c('graph', 'RBGL'))" && \
    R -e "install.packages('dlm',dependencies=TRUE, repos='http://cran.rstudio.com/')" && \
    R -e "install.packages('KFAS',dependencies=TRUE, repos='http://cran.rstudio.com/')" && \
    R -e "install.packages('bsts',dependencies=TRUE, repos='http://cran.rstudio.com/')"
