# This script kills all active Docker containers.
# Use with care!

# This strips the Header
docker ps | grep [a-e0-9] > docker.txt

# Just grab container ID
awk '{print $1}' docker.txt > docker_ids.txt

while read DOCKER_ID
  do docker kill "$DOCKER_ID"
done < docker_ids.txt

# clean up created resources
rm docker.txt
rm docker_ids.txt

echo "DONE..."

docker ps