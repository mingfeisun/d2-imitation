#!/usr/bin/env bash
docker build --build-arg UID=$UID --build-arg USER=$USER -t imitation_tf:1.0 . &
