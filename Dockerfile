FROM alpine:edge

# Install dependencies
RUN apk add --no-cache neovim git curl bash python3 py3-pip clang

# Set the working directory to /root
WORKDIR /root

# clone the dotfiles
RUN mkdir /root/.config
RUN mkdir /root/.config/nvim

RUN pip install pynvim --upgrade

RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Set working directory to /work
WORKDIR /work

ENV TERM xterm-256color
