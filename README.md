# Makefile Project for Synthesis, Routing, Simulation and Programming of FPGA Projects - TangNano 9K

This project is a Makefile created entirely with open-source tools to facilitate the synthesis, routing, simulation and programming of FPGA projects using the TangNano 9K FPGA from Gowin. The workflow is simplified using Yosys, Nextpnr and Icarus via Docker, while OpenFPGALoader and GTKwave must be installed on the user's system.

## Introduction

This Makefile was developed to automate the workflow of developing projects with the TangNano 9K, from synthesis to download to the device. Using Docker ensures that all necessary environments are configured automatically, providing an easy-to-use working environment with fully open-source solutions.

## Features

- Automatic synthesis of FPGA projects using [Yosys](https://github.com/YosysHQ/yosys)
- Routing of FPGA projects with [Nextpnr](https://github.com/YosysHQ/nextpnr) using the [Apicula](https://github.com/YosysHQ/apicula) project
- Simulation of FPGA designs using [Icarus Verilog](https://steveicarus.github.io/iverilog/)
- Generates VCD files with Icarus Verilog, which can be viewed and analyzed in [GTKWave](https://github.com/gtkwave/gtkwave)
- Universal utility for FPGA programming using [OpenFPGALoader](https://github.com/trabucayre/openFPGALoader)
- Development environment encapsulated in [Docker](https://www.docker.com/get-started/)

## Prerequisites

Before starting, make sure you have the following software installed:

- [Docker](https://www.docker.com/get-started/)
- [Make](https://www.gnu.org/software/make/) - to run the Makefile
- [GTKWave](https://github.com/gtkwave/gtkwave) (optional) - To analyze the simulation
- [OpenFPGALoader](https://github.com/trabucayre/openFPGALoader) - for downloading the bitstream to the FPGA

## Usage

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/Alfredosavi/tangnano-hello.git
    cd tangnano-hello
    ```

2. To synthesize and route the project, run:

    ```bash
    make
    ```

3. To compile and simulate the bench tests, run:

   ```bash
   make test
   ```

4. To download the bitstream to the FPGA, run:

    ```bash
    make prog
    ```

5. To download the bitstream to the flash memory, run:

    ```bash
    make flash
    ```

6. To reset the FPGA, run:

    ```bash
    make reset
    ```

7. You can clean up the generated files by running:

    ```bash
    make clean
    ```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
