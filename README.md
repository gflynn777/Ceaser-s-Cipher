# Ceasers-Cipher
An implementation of Ceaser's Cipher written in Scheme.
A decoder implementation that can decode an encoded document either by brute-force using the included dictionary file
or by frequency analysis.

# Background
The cipher translates each letter in a word independently by "shifting" the letter up or down the alphabet by a fixed distance. We assume that we are using the English alphabet with 26 letters in their "usual" order, all
lower case: a, b, c, ... z. The function ctv (character-to-value) maps each character to its value, and the function vtc (value-to-character) maps each value to its corresponding character.
