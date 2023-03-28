FROM fedora:36
RUN dnf install -y curl sudo wget tigervnc-server && dnf clean all
RUN dnf groupinstall -y xfce && dnf clean all
RUN mkdir -p ~/.vnc \
    && echo "123456" | vncpasswd -f > ~/.vnc/passwd \
    && chmod 600 ~/.vnc/passwd
ADD ./xstartup /root/.vnc
EXPOSE 5901
CMD ["bash", "-c", "vncserver :1 -geometry 1280x800 -depth 24 && tail -f /root/.vnc/*.log"]
