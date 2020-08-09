FROM mcr.microsoft.com/azure-cli:latest  
 
ARG WORKSPACE=/root 

RUN apk add \
	git \
	wget \
	vim  

RUN git config --global user.name "John Doe"
RUN git config --global user.email johndoe@example.com

RUN apk add --update nodejs npm
RUN apk --no-cache --update add build-base

WORKDIR $WORKSPACE
COPY .vimrc ${WORKSPACE}/.vimrc 
COPY plug.vim ${WORKSPACE}/.vim/autoload/plug.vim

RUN vim +PlugInstall +qall 

CMD ["vim"]
