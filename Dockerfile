FROM r-base:3.4.0
MAINTAINER chanyub.park "mrchypark@gmail.com"

RUN apt-get update && apt-get install -y python-pip python-dev build-essential libssl-dev libffi-dev

RUN apt-get update && apt-get install -y libopenblas-base r-base-dev
RUN apt-get update && Rscript -e 'install.packages("Rcpp", destdir ="/usr/local/lib/R/site-library")' \
    && Rscript -e 'install.packages("https://cran.r-project.org/src/contrib/reticulate_0.8.tar.gz", repo=NULL, type="source", destdir ="/usr/local/lib/R/site-library")'

COPY app/requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt

COPY app/ /app
WORKDIR /app

ENTRYPOINT ["Rscript"]
CMD ["test.R"]