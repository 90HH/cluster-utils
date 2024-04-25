# Makefile to build and manage Docker and Singularity images

# Define variables
DOCKER_IMAGE_NAME=app
DOCKER_TAG=latest
SIF_IMAGE_NAME=app.sif

# Default target
all: build_sif

# Build Docker image
build_docker:
	docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_TAG) .

# Convert Docker image to Singularity image file (SIF)
build_sif: build_docker
	singularity build $(SIF_IMAGE_NAME) docker-daemon://$(DOCKER_IMAGE_NAME):$(DOCKER_TAG)

# Transfer SIF image to a remote cluster
transfer_sif: build_sif
	scp $(SIF_IMAGE_NAME) username@remote-cluster:/path/to/destination

# Clean up local images
clean:
	docker rmi $(DOCKER_IMAGE_NAME):$(DOCKER_TAG)
	rm -f $(SIF_IMAGE_NAME)

# Help
help:
	@echo "Makefile commands:"
	@echo "  make build_docker - Build Docker image"
	@echo "  make build_sif - Build Singularity image file (SIF)"
	@echo "  make transfer_sif - Transfer SIF to a remote cluster"
	@echo "  make clean - Remove images and files"
	@echo "  make all - Build everything (default)"

.PHONY: build_docker build_sif transfer_sif clean help all