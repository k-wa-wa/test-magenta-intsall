FROM --platform=linux/x86_64 python:3.8

RUN apt-get update
RUN apt-get -y install build-essential libasound2-dev libjack-dev portaudio19-dev wget libhdf5-dev libtinfo5

RUN wget https://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz && \
  tar xf clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz && \
  cd clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04 && \
  cp -R * /usr/local

ENV LLVM_CONFIG=/usr/local/bin/llvm-config

RUN pip install magenta
RUN python -c "import magenta;print(magenta)"

CMD ["echo", "done"]

