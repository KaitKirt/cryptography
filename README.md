# 🔐 Cryptography Decoder (MATLAB)

This repository contains a cryptographic decoding project written in MATLAB. It was developed as part of the CMOR220 course at Rice University during Spring 2024.

## 📜 Project Overview

The goal of this project is to decrypt an encoded text using letter frequency analysis and probabilistic modeling. The decoder uses a transition matrix of letter probabilities and iteratively searches for the most likely decoding key by maximizing a log-likelihood function.

## 📂 Files Included

- `Project3.m` — Main script with all decoding functions.
- `encodedtext.txt` — File containing the encrypted message.
- `letterprob.mat` — Matrix of letter pair probabilities used for scoring.

## ⚙️ Features

- Converts text to numerical ASCII values for processing.
- Implements a stochastic optimization technique (random swaps) to improve the decryption key.
- Uses a transition matrix to evaluate the likelihood of letter pairings.
- Decodes and cleans output by mapping back to readable text.

## 💡 Key Concepts

- ASCII encoding and decoding
- Markov transition matrices
- Log-likelihood scoring
- Monte Carlo-style optimization
- Basic cryptanalysis techniques

## 🧪 How to Run

Make sure all files (`Project3.m`, `encodedtext.txt`, and `letterprob.mat`) are in the same directory. Then run in MATLAB:

```matlab
Project3
