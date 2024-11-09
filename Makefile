# Set the image name and container name
IMAGE_NAME = fastapi_postgres_docker
CONTAINER_NAME = fastapi

# Build the Docker images
build:
	docker-compose build

# Start the Docker containers in detached mode
up:
	docker-compose up -d

# Bring down the Docker containers
down:
	docker-compose down

# Rebuild and restart the Docker containers
restart: down build up

# View logs of the FastAPI app container
logs:
	docker logs -f $(CONTAINER_NAME)

# Access the FastAPI app container's shell
exec:
	docker exec -it $(CONTAINER_NAME) /bin/bash

# Run migrations (if you have any scripts for this)
migrate:
	docker exec -it $(CONTAINER_NAME) alembic upgrade head

# Stop the Docker containers
stop:
	docker-compose stop

# Remove Docker volumes (useful for clearing data)
clean:
	docker-compose down -v

# Remove all stopped containers, unused networks, and dangling images
prune:
	docker system prune -f

# List all Docker containers
ps:
	docker ps -a

# List all Docker images
images:
	docker images

# Build and run everything (builds the image, starts containers, and logs in)
run: build up logs