FROM python #donwload python image

MAINTAINER hipsterSantos <santoscampos269@gmail.com> # set the maintainer 
ENV INSTALL_PATH /app # set env variable

RUN mkdir -p $INSTALL_PATH #execute command mkdir 
WORKDIR $INSTALL_PATH # set the curren working dir 

COPY requirement.txt requirement.txt # copy the current requirement.txt from local set to internal server

RUN pip install -r requirement.txt # run the command pip install

COPY . . # copying everything from local to the current container

CMD gunicorn -b 0.0.0.0:4000 --access-logfile - "app.app:createServer()" # after everything execute this command using gunicorn