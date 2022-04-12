# download and unzip
wget https://github.com/mingfeisun/mujoco_demo_data/archive/refs/heads/data-v2.zip -O data.zip \
  && unzip data.zip -d tmp_data \
  && rm data.zip

mv tmp_data/mujoco_demo_data-data-v2/expert_data expert_data-v2
rm -rf tmp_data