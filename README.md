# Portable ROS Setups

## Overview

This repository contains instructions for setting up ROS on Linux and Mac OS using conda. The instructions were derived from [Robostack](https://robostack.github.io/index.html). The setup script creates a conda environment for ROS Noetic Desktop. We recommend that you create a copy of this conda environment for your projects and add any additional (conda or ROS) packages you require for your project.

This script has been tested on Mac OS X (M1) hosts.

## Setup

Follow the instructions below to create the ROS conda environment. **Note** that we assume you already installed [anaconda](https://www.anaconda.com) or [miniconda](https://docs.conda.io/en/latest/miniconda.html) on your system.

To run the setup script in `conda-setup`, run the following lines:
```
# NOTE: We assume you're in the directory for this repository.
# Make the script executable.
cd conda-setup
chmod +x setup-ros-noetic.sh

# Create the ROS environment.
./setup-ros-noetic.sh

# Activate the new environment.
conda activate ros-noetic
```

You can clone this environment using the following command:
```
conda create --name ros-noetic-clone --clone ros-noetic
```
You should substitute the name `ros-noetic-clone` for a name you like. For example, you can name the clone the name of your current ROS project.
