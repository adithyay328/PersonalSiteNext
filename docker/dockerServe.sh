# Runs docker container, and serves the site over http
sudo docker build -t ps_next_base -f dockerBase.dockerfile .

# Ask for port number to bind to
echo "What port should we bind this container to?"
read portNum

# Now, get the directory to bind mount to the container. This
# is just the parent directrory
DIR="$( cd ..; pwd)"

# Now, bind mount the directory to the container, and run npm build. Make sure to
# port map local portNum to container 3000
sudo docker run -it --mount type=bind,source=$DIR,target=/project -p $portNum:3000 --workdir /project/personal_website ps_next_base npm run dev