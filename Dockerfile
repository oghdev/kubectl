FROM bitnami/kubectl:1.29-debian-12

USER root

RUN apt-get update \
  && apt-get install rsync s3cmd curl -y \
  && rm -rf /var/lib/apt/lists/* 
  
RUN curl -sSL https://github.com/vmware-tanzu/velero/releases/download/v1.13.1/velero-v1.13.1-linux-amd64.tar.gz -o velero-v1.13.1-linux-amd64.tar.gz \
  && tar -xvf velero-v1.13.1-linux-amd64.tar.gz \
  && mv velero-v1.13.1-linux-amd64/velero /usr/local/bin/velero \
  && chmod +x /usr/local/bin/velero \
  && rm -rf ./velero-v1.13.1-linux-amd64 velero-v1.13.1-linux-amd64.tar.gz \
  && velero --help

USER 1001