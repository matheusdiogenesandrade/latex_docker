# Setup user permissions

```

sudo groupadd docker

sudo usermod -aG docker ${USER}

su ${USER}

```

# Set the desired image 

## For the whole application

```

IMAGE=blang/latex 

```

## For a partial images

```

IMAGE=blang/latex:ubuntu

IMAGE=blang/latex:ctanbasic

IMAGE=blang/latex:ctanfull

```

# Pull the image

```

docker pull ${IMAGE}

```

# Run the image

```

docker run "$IMAGE" run.sh

```

