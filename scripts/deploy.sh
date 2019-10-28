
mkfifo -m=600 fifo
# why ssh-agent is needed to eval
# https://stackoverflow.com/questions/17846529/could-not-open-a-connection-to-your-authentication-agent/4086756#408675://stackoverflow.com/questions/17846529/could-not-open-a-connection-to-your-authentication-agent/4086756#4086756
eval $(ssh-agent -s)

echo "echo ''" > $ask
chmod +x $ask

echo "$SSH_SECRET" >fifo | SSH_ASKPASS=$ask ssh-add fifo
scp -P $SSH_PORT -r build stenrine@boostcamp.stenrine.com:/home/stenrine/build
