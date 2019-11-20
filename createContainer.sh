username="$USER"
user="$(id -u)"
default_image="andreweiner/basilisk:20-11-19"
image="${1:-$default_image}"
default_container_name="basilisk"
container_name="${2:-$default_container_name}"

docker container run -it -d --name $container_name        \
  --user=${user}                                          \
  -e USER=${username}                                     \
  -v="$PWD":$HOME                                         \
  --workdir=$HOME                                         \
  --volume="/etc/group:/etc/group:ro"                     \
  --volume="/etc/passwd:/etc/passwd:ro"                   \
  --volume="/etc/shadow:/etc/shadow:ro"                   \
  --volume="/etc/sudoers.d:/etc/sudoers.d:ro"             \
    $image
