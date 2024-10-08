FROM centos:latest

ARG cyb3rhq_branch
ARG cyb3rhq_api_branch
ARG cyb3rhq_doc_branch

# enable SSH
RUN yum install openssl openssh-server -y
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo 'root:cyb3rhq_admin' | chpasswd
RUN ssh-keygen -A

EXPOSE 22

# install dependencies
RUN dnf install make gcc automake autoconf libtool git which sudo wget sqlite -y

# install Python 3
RUN dnf install python3 -y

# install Cyb3rhq
RUN git clone https://github.com/cyb3rhq/cyb3rhq && cd /cyb3rhq && git checkout ${cyb3rhq_branch}
# build Python dependencies
RUN sed -i 's!--index-url=file://${ROUTE_PATH}/${EXTERNAL_CPYTHON}/Dependencies/simple!!' /cyb3rhq/src/Makefile
COPY preloaded-vars.conf /cyb3rhq/etc/preloaded-vars.conf
RUN /cyb3rhq/install.sh

# cyb3rhq-documentation and dependencies
RUN git clone https://github.com/cyb3rhq/cyb3rhq-documentation && cd /cyb3rhq-documentation && git checkout ${cyb3rhq_doc_branch}
RUN pip3 install Sphinx==1.6.5 sphinx-rtd-theme==0.2.4 sphinxcontrib-images==0.7.0 sphinxprettysearchresults==0.3.5

# install pip libraries for development
RUN /var/ossec/framework/python/bin/pip3 install pytest ipython defusedxml ptvsd pydevd-pycharm~=191.6605.12 freezegun

# install and configure Cyb3rhq API
RUN dnf install nodejs -y && npm config set user 0
RUN git clone https://github.com/cyb3rhq/cyb3rhq-api && cd /cyb3rhq-api && git checkout ${cyb3rhq_api_branch} && ./install_api.sh && npm install mocha apidoc -g && npm install glob supertest mocha should moment mochawesome sqlite3

# install ZSH
RUN yum install zsh -y
RUN cd /root && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# copy script for running mocha tests
COPY run_mocha_tests.sh /cyb3rhq-api

# copy script for generating Cyb3rhq API reference
COPY generate_api_doc.sh /cyb3rhq-api/doc/generate_api_doc.sh

# copy entrypoint and configuration files
COPY entrypoint.sh /scripts/entrypoint.sh
COPY master-ossec.conf /scripts/master-ossec.conf
COPY worker-ossec.conf /scripts/worker-ossec.conf
