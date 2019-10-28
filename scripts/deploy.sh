# Set no display, necessary for ssh to play nice with setsid and SSH_ASKPASS.
export DISPLAY=:0
export SSH_ASKPASS=''

mkfifo -m=600 fifo
# why ssh-agent is needed to eval
# https://stackoverflow.com/questions/17846529/could-not-open-a-connection-to-your-authentication-agent/4086756#408675://stackoverflow.com/questions/17846529/could-not-open-a-connection-to-your-authentication-agent/4086756#4086756
eval $(ssh-agent)

#echo "$SSH_SECRET" >fifo | ssh-add fifo
ssh-add <(echo "$SSH_SECRET")
which ssh-add
scp -o "StrictHostKeyChecking no" -P $SSH_PORT -r build stenrine@boostcamp.stenrine.com:/home/stenrine/build
