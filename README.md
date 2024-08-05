# WZE website

deployed at https://wze.ecology.uni-jena.de/

## Notes

- this is quarto documents with embedded shiny apps inside a rocker/geospatial docker container
- data is not part of the container image but will be mounted on deployment

## Deploy

```sh
git clone git@github.com:WZE-Jena/pages.git
cd pages
docker compose up --build
```