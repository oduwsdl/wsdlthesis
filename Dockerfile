FROM debian:stretch

LABEL maintainer=<@WebSciDL>

WORKDIR /src

RUN apt update && apt-get install -y \
      git \
      make \
      python-pygments \
      texlive-full \
    && rm -rf /var/lib/apt/lists/*

COPY . /src

CMD ["make"]
