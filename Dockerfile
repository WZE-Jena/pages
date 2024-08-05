FROM rocker/geospatial:4

RUN apt-get update && \
    apt-get install -y \
    pandoc \
    wget \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    git && \
    apt-get clean

RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.5.56/quarto-1.5.56-linux-amd64.deb && \
    dpkg -i quarto-1.5.56-linux-amd64.deb && \
    rm quarto-1.5.56-linux-amd64.deb

RUN R -e 'install.packages("leaflet")'
RUN R -e 'install.packages("openxlsx")'
RUN R -e 'install.packages("jsonlite")'
RUN R -e 'install.packages("ggbeeswarm")'

WORKDIR /app
COPY src/ ./
EXPOSE 80
CMD ["quarto", "serve", "index.qmd", "--port", "80", "--host", "0.0.0.0"]