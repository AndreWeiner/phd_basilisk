# Basilisk volume-of-fluid (VoF)-based flow solver

This repository contains the source code and scripts to simulate an axis-symmetric rising bubble in [Basilisk](http://basilisk.fr/). The solver was used to create the Basilisk simulations described in the PhD thesis:
```
Modeling and simulation of convection-dominated species transfer at rising bubbles
```
The solver is based on the Basilisk test cases
- [bubble.c](http://basilisk.fr/src/examples/bubble.c)
- [rising.c](http://basilisk.fr/src/test/rising.c)
- [the sandbox of acastillo](http://basilisk.fr/sandbox/acastillo/readme) (VTK support)

## Dependencies

To make the simulation results reproducible, a Docker image with a pre-configured Basilisk installation has been created. The Dockerfile is available in a separate [repository](https://github.com/AndreWeiner/basilisk_docker). Any installed version of [Docker](https://docs.docker.com/install/) greater than **1.10** will be able to pull and execute the Docker image hosted on [Dockerhub](https://hub.docker.com/r/andreweiner/basilisk). There are convenience scripts to create and start a Docker container which require root privileges. To avoid running the scripts with *sudo*, follow the [post-installation steps](https://docs.docker.com/install/linux/linux-postinstall/).

The convenience script *createContainer.sh* by default pulls the image tagged with **20-11-19**, which stands for the 20th of November 2019 (the creation date of the image).

## Starting a simulation

To pull the Basilisk image and to create a container with suitable settings, run:

```
./createContainer.sh
```
The script has to be executed **only once** on a fresh installation/workstation. To compile the solver contained in the *solver* directory, run:

```
./startContainer.sh
# inside the container
cd solver
make
```
From within the container, create a *run* directory and execute the solver:
```
# continuing from the previous code-box
cd ..
mkdir run
cd run
mpirun -np 4 $HOME/solver/bubble 13 2.0 200.0
```
The code-block above executes the solver with 4 MPI processes (-np 4). The command-line arguments can be used to create different refinement levels and physical conditions:

- the first argument is an integer value defining the maximum allowed **refinement level**
- the second argument is a double defining the **Bond/Eotvos number**
- the third argument is a double defining the **Galilei number**

For more information about the setting, follow the links at the beginning of this document.

## How to reference

This repository accompanies the following publication, which will be published by spring 2020:
```
@electronic{weiner2020,
  address = {Darmstadt},
  author = {Weiner, Andre},
  hdsurl = {xxx},
  keywords = {xxx},
  title = {Modeling and simulation of convection-dominated species transfer at rising bubbles},
  uniqueid = {xxx},
  url = {xxx},
  year = 2020
}
```
