FROM buildkite/puppeteer

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN apt update && \
    apt install -y  \
    ffmpeg && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/logicsquares/spotify-dl.git
WORKDIR spotify-dl
RUN npm install; npm link

## uncomment this for local testing
# COPY ./ /usr/local/lib/node_modules/spotify-dl/ 
WORKDIR /download
ENTRYPOINT ["spotifydl"]
CMD ["--help"]
