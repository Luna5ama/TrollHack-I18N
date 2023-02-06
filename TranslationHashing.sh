rm -r ~/hash-temp
mkdir ~/hash-temp
cp *.lang ~/hash-temp/
(sha512sum ~/hash-temp/*.lang | grep -o -P '.*?(?= )' | sha512sum) >> ~/hash-temp/.hash
git config user.name "GitHub Actions Bot"
git config user.email "<>"
git config 
git switch --orphan translation
cp -r ~/hash-temp/. .
git add *.lang .hash
git commit -m 'Update translation'
git push -f origin translation
rm *.lang
rm .hash
git switch master
git config --unset user.name
git config --unset user.email