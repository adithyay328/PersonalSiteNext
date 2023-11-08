# Start by just building the CLI
sudo docker build -t ps_next_base -f dockerBase.dockerfile .

# Now, get the directory to bind mount to the container. This
# is just the parent directrory
DIR="$( cd ..; pwd)"

# Now, bind mount the directory to the container, and run the
# container with cmd=bash and working directory=/project
sudo docker run -it --mount type=bind,source=$DIR,target=/project --workdir /project ps_next_base bash