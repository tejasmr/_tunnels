curl  http://localhost:4040/api/tunnels > tunnels.json
git init
git add .
git commit -m "Updated tunnels.json"
git branch -M main
# git remote add origin git@github.com:tezz-io/_tunnels.git
git push -u origin main
