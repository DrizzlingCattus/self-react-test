# Set no display, necessary for ssh to play nice with setsid and SSH_ASKPASS.
export DISPLAY=:0

mkfifo -m=600 fifo
# why ssh-agent is needed to eval
# https://stackoverflow.com/questions/17846529/could-not-open-a-connection-to-your-authentication-agent/4086756#408675://stackoverflow.com/questions/17846529/could-not-open-a-connection-to-your-authentication-agent/4086756#4086756
eval $(ssh-agent -s)

ask="./temp"
echo "echo ''" > $ask
chmod +x $ask

echo "$SSH_SECRET" >fifo | SSH_ASKPASS=$ask ssh-add fifo
scp -o "StrictHostKeyChecking no" -P $SSH_PORT -r build stenrine@boostcamp.stenrine.com:/home/stenrine/build
