
mkfifo -m=600 fifo
eval $(ssh-agent -s)
echo $SSH_SECRET >fifo | ssh-add fifo
scp -p $SSH_PORT -r build stenrine@boostcamp.stenrine.com:/home/stenrine/build
