# Builds as static and exports it
sudo docker build -t ps_next_base -f dockerBase.dockerfile .

# Now, get the directory to bind mount to the container. This
# is just the parent directrory
DIR="$( cd ..; pwd)"

# Now, bind mount the directory to the container, and run npm build
sudo docker run -it --mount type=bind,source=$DIR,target=/project --workdir /project/personal_website ps_next_base npm run build