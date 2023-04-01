FROM tensorflow/tensorflow:1.14.0-py3 

RUN apt update && apt install -y --allow-unauthenticated wget build-essential libosmesa6-dev libglew-dev
RUN apt install -y python3-dev patchelf
RUN apt install -y openmpi-bin openmpi-common openssh-client libopenmpi-dev zlib1g-dev unzip
RUN pip3 install pip --upgrade pip

ARG UID
ARG USER
RUN useradd -u $UID --create-home $USER
USER $USER
WORKDIR /home/$USER

RUN mkdir -p /home/$USER/.mujoco 

RUN wget https://www.roboti.us/download/mjpro150_linux.zip -O mujoco.zip \
    && unzip mujoco.zip -d /home/$USER/.mujoco \
    && rm mujoco.zip

# put the liscense under the current folder
COPY mjkey.txt /home/$USER/.mujoco/mjkey.txt

ENV LD_LIBRARY_PATH /home/$USER/.mujoco/mjpro150/bin:${LD_LIBRARY_PATH}

# install all requirements
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

# vim shortcuts
RUN echo 'set editing-mode vi' >> /home/$USER/.inputrc
RUN echo 'set keymap vi' >> /home/$USER/.inputrc

WORKDIR /home/$USER/imitation
