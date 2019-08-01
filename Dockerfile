FROM debian:buster

LABEL maintainer=<@WebSciDL>

WORKDIR /src

RUN apt update && apt-get install -y \
      dumb-init \
      git \
      make \
      python-pygments \
      texlive-full \
    && rm -rf /var/lib/apt/lists/*

COPY . /src

ENTRYPOINT ["dumb-init", "--"]
CMD ["make"]
