# Line Following Robot - Model-Based Design Project

This repository contains the complete implementation of a **Line Following Robot** using the **Model-Based Design (MBD)** methodology. 

---

# Project Description

![image alt](https://github.com/IAm-Caleb/Group11_LineFollowingRobot_Pt2/blob/main/car.jpg?raw=true)

The Line Following Robot is designed to autonomously follow a pre-defined black line path using infrared (IR) sensors and control logic implemented through simulation and automatic code generation. The development process leverages MATLAB/Simulink for modeling, simulation, and code generation, and integrates SolidWorks for mechanical design. The final product was tested both in simulation and on physical hardware using Arduino.

This project emphasizes the use of MBD to streamline the robotics development cycle — from conceptual modeling to hardware deployment — by focusing on system behavior and simulation-driven development instead of manual coding.

---

# Objectives

- Develop a complete Simulink model of a line-following robot.
- Simulate and verify robot behavior using model-in-the-loop testing.
- Automatically generate embedded C code from the model.
- Deploy the code onto an Arduino-based prototype for real-world validation.
- Document the MBD workflow from design to deployment.

---

# Tools & Technologies Used

- MATLAB & Simulink
- Simulink Coder / Embedded Coder
- Stateflow (for state machines)
- SolidWorks (for mechanical design)
- Arduino Uno + IR Sensors + Motor Driver
- GitHub (Version Control)

---

# System Architecture

# Block Diagram

![image alt](https://github.com/IAm-Caleb/Group11_LineFollowingRobot_Pt2/blob/main/Screenshot%20(43).png?raw=true)

The system is modeled as a closed-loop control system. Inputs from IR sensors are processed by decision logic, which generates PWM signals to drive the motors and keep the robot on track.

---



## 💻 Simulations

Simulation was performed in Simulink to:

- Validate sensor logic
- Observe motor speed and direction in real-time


# Code Generation & Deployment

The final Simulink model was configured for automatic code generation using **Simulink Coder**, targeting the Arduino Uno board. The generated code was uploaded via Arduino IDE, allowing real-time response based on IR sensor inputs.

# Code Generation Workflow:

1. Build validated model in Simulink
2. Set target as Arduino Uno
3. Generate C code automatically
4. Deploy to Arduino via USB

---

# Testing & Validation

Testing followed these four levels of verification:

| Testing Phase            | Description |
|--------------------------|-------------|
| **Model-in-the-Loop (MIL)** | Test model logic and transitions in Simulink |
| **Software-in-the-Loop (SIL)** | Test generated code in simulation |
| **Processor-in-the-Loop (PIL)** | Upload code to Arduino and observe outputs |
| **Hardware-in-the-Loop (HIL)** | Complete robot built and tested in real-world |


