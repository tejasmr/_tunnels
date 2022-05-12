killall ngrok
sleep 1
ngrok tcp 22 > /dev/null &
sleep 1
curl  http://localhost:4040/api/tunnels > tunnels.json
echo $(cat tunnels.json | jq -r '.tunnels[0].public_url') > tunnels.json
git config user.name tezz-io
git config user.email totejasmr@gmail.com
DIR="/home/pi/ssh/.git"
if [ ! -d "$DIR" ]; then
  git init
fi
git add .
git commit -m "Updated tunnels.json"
git branch -M main
DIR="/home/pi/ssh/.git/refs/remotes/origin"
if [ ! -d "$DIR" ]; then
  git remote add origin git@github.com:tezz-io/_tunnels.git
fi
git push -u origin main
