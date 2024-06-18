# to publish the webpage, please run the following lines in the Terminal
quarto render
git add docs
git commit -m "Publish site to docs/"
git push

git lfs migrate import --include="*.shp"
git lfs migrate import --include="*.dbf"