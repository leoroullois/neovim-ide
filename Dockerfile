FROM ubuntu:23.04

RUN apt update && apt install -y \
  wget \
  git \
  python3 \
  build-essential \
  manpages-dev \
  nodejs \
  npm

RUN wget https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb
RUN apt install ./nvim-linux64.deb

RUN mkdir -p /root/workspace && mkdir -p /root/.config

COPY nvim/ /root/dotfiles/nvim/
RUN ln -s /root/dotfiles/nvim /root/.config/

RUN npm install -g yarn && \
yarn global add neovim prettier && \
apt install -y ripgrep \
fd-find \
xsel \
python3 \
python3-pip

WORKDIR /root/workspace

CMD ["/bin/bash"]
