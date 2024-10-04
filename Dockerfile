FROM ubuntu:22.04

# Dependências e VIM (para edição)
RUN apt-get update && apt-get install python3.10 bzip2 zlib1g-dev make g++=4:11.2.0-1ubuntu1 vim -y

# Arquivos necessários
COPY OrCS /OrCS
COPY RequiredFiles /RequiredFiles


# Prepara o gerador de traços
RUN cp /RequiredFiles/pinplay* /OrCS/trace_generator/
RUN cd OrCS && ./install_tracer.sh && cd -

# Compila o gerador de traços
RUN cd OrCS/trace_generator/extras/pinplay/sinuca_tracer && make clean && make && cd -

# Repassa o controle do terminal
CMD [ "bash" ]