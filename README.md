# 🚀 PID Controller Tuning using Ziegler–Nichols Method

## 📌 Project Description

This project demonstrates the design and simulation of **P, PI, and PID controllers** using the **Ziegler–Nichols tuning method**. The plant is modeled in MATLAB, controller parameters are computed from frequency response, and performance is validated via step-response simulations in MATLAB and Simulink.

---

## 🎯 Objectives

* Determine **Ultimate Gain (Ku)** and **Ultimate Period (Pu)**
* Compute controller parameters (Kp, Ti, Td) using ZN rules
* Compare time-domain performance of P, PI, and PID controllers
* Validate results using both MATLAB scripts and Simulink model

---

## ⚙️ System Model

[
G(s) = \frac{1}{s(s+2)(s+5)}
]

* Third-order system
* One pole at origin → Type-1 system
* Two real poles at -2 and -5

---

## 🧪 Methodology

### 1) Frequency Response Analysis

Using `margin()` in MATLAB:

* Ultimate Gain: **Ku = 70**
* Ultimate Period: **Pu = 1.99 sec**

---

### 2) Ziegler–Nichols Tuning Rules

| Controller | Kp      | Ti       | Td     |
| ---------- | ------- | -------- | ------ |
| P          | 0.5 Ku  | —        | —      |
| PI         | 0.45 Ku | Pu / 1.2 | —      |
| PID        | 0.6 Ku  | Pu / 2   | Pu / 8 |

---

### 3) Computed Parameters

| Controller | Kp    | Ti (sec) | Td (sec) |
| ---------- | ----- | -------- | -------- |
| P          | 35.00 | —        | —        |
| PI         | 31.50 | 1.66     | —        |
| PID        | 42.00 | 0.99     | 0.25     |

---

## 💻 Implementation

### MATLAB Scripts

* `zn_tuning.m` → Computes Ku, Pu, controller parameters
* `controller_comparison.m` → Generates step responses

### Simulink Model

* Closed-loop system with:

  * Step input
  * Sum (+ −)
  * PID Controller
  * Transfer Function
  * Scope

---

## 📊 Results & Analysis

### 🔹 P Controller

* Fast rise time
* **Steady-state error present**
* Moderate oscillations

---

### 🔹 PI Controller

* **Zero steady-state error**
* Slower response
* Increased overshoot

---

### 🔹 PID Controller

* **Fastest response**
* **Zero steady-state error**
* **Higher overshoot** (ZN tuning is aggressive)

---

## 📈 Comparative Summary

| Metric             | P        | PI       | PID     |
| ------------------ | -------- | -------- | ------- |
| Rise Time          | Fast     | Moderate | Fastest |
| Overshoot          | Low      | Medium   | High    |
| Settling Time      | Moderate | Higher   | Lowest  |
| Steady-State Error | Present  | Zero     | Zero    |


## 🧰 Tools Used

* MATLAB
* Simulink

---

## 🔍 Key Insights

* Ziegler–Nichols provides **quick initial tuning**, not optimal tuning
* PID gives best overall performance but may require **fine-tuning**
* PI is preferred when **zero steady-state error** is critical

---

## 🚧 Limitations

* ZN method leads to **high overshoot**
* Not suitable for systems requiring **high precision tuning**
* Sensitive to noise (due to derivative action)

---

## 🔮 Future Work

* Implement optimization-based tuning (GA, PSO)
* Compare with Cohen–Coon method
* Apply to real-time hardware (Arduino/PLC)

---

## 👨‍💻 Author

**Kunal Gadhave**
Mechatronics Engineering Student
---
