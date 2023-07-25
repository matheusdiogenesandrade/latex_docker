sudo groupadd docker
sudo usermod -aG docker ${USER}
su ${USER}
# Set the desired image 
# for an entire image
#IMAGE=blang/latex 
# for an partial image
#IMAGE=blang/latex:ubuntu
#IMAGE=blang/latex:ctanbasic
IMAGE=blang/latex:ctanfull
# Pull image
docker pull ${IMAGE}
docker run "$IMAGE" run.sh


