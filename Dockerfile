FROM ubuntu:latest

# COPY ./jpf-core /root
# COPY ./jpf-symbc /root


RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install git openjdk-8-jdk openjdk-8-jre ant libz3-java && \
    cd /root && git clone https://github.com/SymbolicPathFinder/jpf-symbc.git && \
    git clone https://github.com/yannicnoller/jpf-core.git && \
    apt-get -y purge openjdk-11* && \
    apt-get -y purge git && \
    cd /root/jpf-core && ant && cd /root/jpf-symbc && ant && \
    cd /root && mkdir .jpf && cd .jpf && \
    echo -e "jpf-core = \${user.home}/jpf-core\n\njpf-symbc = \${user.home}/jpf-symbc\n\nextensions=\${jpf-core},\${jpf-symbc}" > site.properties && \
    echo -e "#!/bin/bash\njava -jar /root/jpf-core/build/RunJPF.jar $1" > /root/entrypoint.sh && \
    chmod +x /root/entrypoint.sh && \
    mv /root/jpf-symbc/doc/Example.j* /root/jpf-symbc/src/examples && \
    rm -rf /var/lib/apt/lists/*


ENV HOME /root

WORKDIR /root

# ENTRYPOINT ["/root/entrypoint.sh"]
# CMD [ "/root/jpf-symbc/src/examples/Test.jpf" ]
CMD [ "bash" ]