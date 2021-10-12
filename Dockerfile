FROM centos:8
RUN yum - y install openssh-server 
RUN useradd remoted_user && \
    echo "password123" | passwd remoted_user --stdin 
    mkdir /home/remoted_user/.ssh 
    chmod 700 /home/remoted_user/.ssh 

COPY remote-key.pub /home/remote-user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
    chown 600 /home/remote_user/.ssh/authorized_keys

RUN /usr/sbin/sshd-keygen

CMD /usr/sbin/sshd -D 
