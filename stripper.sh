#!/bin/sh

rm -rf /tmp/stripdance
git clone $STRIP_REPO /tmp/stripdance
cd /tmp/stripdance

curl -L -o main.zip https://github.com/truecharts/catalog/archive/refs/heads/main.zip

unzip main.zip
rm -f main.zip
cd catalog-main

ls -la .

rm -rf .github
mkdir sexy

cd stable
ls -1 . |
grep -E "^($STRIP_STABLE)\$" |
xargs cp -r -t ../sexy/

cd ../incubator
ls -1 . |
grep -E "^($STRIP_INCUBATOR)\$" |
xargs cp -r -t ../sexy/

cd ..

rm -rf dependency enterprise incubator stable

for x in ./* ./.[!.]* ./..?*; do
  if [ -e "$x" ]; then mv -- "$x" ../; fi
done

cd ..
rm -rf catalog-main

git add .
git config --global user.email "you@example.com"
git config --global user.name "Sexy Stripper"
git commit -a --amend -m "update" || git commit -a -m "update"
git push -f

cd /tmp
rm -rf /tmp/stripdance
