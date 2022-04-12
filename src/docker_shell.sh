#!/usr/bin/env bash

if hash nvidia-docker 2>/dev/null; then
  cmd=nvidia-docker
else
  cmd=docker
fi

${cmd} run -e OMPI_MCA_btl_vader_single_copy_mechanism=none --rm --user $(id -u) -v `pwd`:/home/$USER/imitation -it imitation_tf:1.0
