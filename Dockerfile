FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Caleb-debug848/Zokou-MD-english /root/Zokou_BOt
WORKDIR /root/Zokou_Bot/


COPY package.json .
RUN npm install pm2 -g
RUN npm install

COPY . .

EXPOSE 5000

CMD ["npm", "run" , "web"]
