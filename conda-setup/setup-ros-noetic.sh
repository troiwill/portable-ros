#!/bin/bash

CONDA_INSTALL_DIR=$(conda info | grep -i 'base environment' | grep -Eo '(/[a-zA-Z0-9]+)+')
ROS_DISTRO="noetic"
CONDA_ROS_BASE_ENV="ros-${ROS_DISTRO}"

exit_on_error() {
    echo "failed."
    exit 1
}

# Source the conda script.
source "${CONDA_INSTALL_DIR}/etc/profile.d/conda.sh"

# Install the mamba package.
echo "Installing the mamba command if it does not exist."
conda activate base || exit_on_error
conda install -y mamba -c conda-forge || exit_on_error

# Create the base environment for ROS.
echo "Create the base environment for ROS ${ROS_DISTRO}."
mamba create -n ${CONDA_ROS_BASE_ENV} -y python=3.9 || exit_on_error
conda activate ${CONDA_ROS_BASE_ENV} || exit_on_error
conda config --env --add channels conda-forge || exit_on_error
conda config --env --add channels robostack || exit_on_error
conda config --env --add channels robostack-experimental || exit_on_error
mamba install -y ros-noetic-desktop || exit_on_error

mamba install -y compilers cmake pkg-config make ninja || exit_on_error
mamba install -y catkin_tools || exit_on_error

# only on linux, uncomment lines if you are having issues finding GL/OpenGL, also do:
# mamba install mesa-libgl-devel-cos7-x86_64 \
#     mesa-dri-drivers-cos7-x86_64 \
#     libselinux-cos7-x86_64 \
#     libxdamage-cos7-x86_64 \
#     libxxf86vm-cos7-x86_64 \
#     libxext-cos7-x86_64 \
#     xorg-libxfixes || exit_on_error

conda deactivate || exit_on_error
conda activate ${CONDA_ROS_BASE_ENV} || exit_on_error

mamba install -y rosdep || exit_on_error
rosdep init || exit_on_error
rosdep update || exit_on_error

echo ""
echo ""
echo "Base conda environment for ROS is now set up!"
echo "You can activate your environment by running:"
echo ""
echo "    conda activate ${CONDA_ROS_BASE_ENV}"
echo ""
