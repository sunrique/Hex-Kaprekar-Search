# Quantitative Discovery: Hex-Kaprekar Sequences & Collatz Entropy

**Principal Investigator:** Enrique Coello-montoya  
**Date:** February 2026  
**Tools:** SageMath (CoCalc), Lean 4 (Formal Verification)

## Abstract
This project documents the discovery of the Base-16 Kaprekar sequence and an empirical analysis of the Collatz Conjecture's structural "Parity Drift."

## I. Hexadecimal Kaprekar Sequence
A Kaprekar number $n$ is defined by the property that $n^2$ in a given base can be split into two parts $L$ and $R$ such that $L + R = n$. This repository provides the exhaustive list of these numbers for Base-16 up to $10^6$.

* **Logic:** `search.sage` (SageMath implementation)
* **Formal Proof:** `verify.lean` (Lean 4 verification of boundary cases)
* **Data:** `results.txt` (Confirmed integers: 0, 1, 6, 10, 15, 51, 85, 91, 120, 136, 171, 205, 255...)

## II. Collatz Parity Drift
By analyzing the geometric mean of multipliers in the $3n+1$ function, we identify a consistent "Entropy Bias" of $\approx 0.68$ (or $0.85$ for certain seed populations). This confirms that the sequence is structurally biased toward decay ($< 1.0$), providing a heuristic explanation for the conjecture's stability.

* **Analysis:** `collatz.sage`

---
*License: MIT*
