project="testing-travis"

#try placing $project everywhere project_name_goes_here is located...in theory it should work, but that wasn't how I set it up so there might be a reason for that; I will update this file when I test



mkdir $project
mv $(pwd)/windows/$project.exe $project
mv $(pwd)/windows/$project_Data $project


zip -r $project.zip $project


echo "Deploy to Itch"
wget http://dl.itch.ovh/butler/darwin-amd64/head/butler
chmod +x butler
touch butler_creds
echo -n $ITCH_API_KEY > butler_creds

./butler push $project.zip hacktavist/testing-travisci-deployment:windows -i butler_creds

echo "Cleaning"

./butler logout -i butler_creds --assume-yes
rm butler