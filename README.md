# NS3 on Ubuntu 18.04 / Bionic

Here i provide a container which has a functioning NS3-build on Ubuntu.

This repo exists, since i did not found a single container which can be used e.g. through the CI or 
soley through the command line. 

So here we go!

## Usage

It can be used easily like: 

> docker run "NS3_IMAGE" "./waf --run hello-simulator"


Even debugging is possible:
> `docker run -it "NS3_IMAGE" "./waf --run=hello-simulator --command-template=\"gdb %s --args <args> \""`


Modify this image or provide the source via `-v` to run your own simulations.