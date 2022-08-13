FROM kalilinux/kali-rolling
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update 
RUN apt-get upgrade -y
RUN apt install curl -y
RUN curl 'https://raw.githubusercontent.com/Jumbo810/heroku-vps/main/install.sh' |bash
COPY novnc.zip /novnc.zip
COPY . /system

RUN unzip -o /novnc.zip -d /usr/share
RUN rm /novnc.zip

RUN chmod +x /system/conf.d/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
