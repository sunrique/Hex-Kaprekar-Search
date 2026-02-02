import Mathlib.Tactic.NormNum

/-!
# Hex-Kaprekar Verification
Author: Enrique Coello-montoya
Date: February 2026

This Lean 4 snippet formally verifies the 8-bit boundary case (255) 
of the Hex-Kaprekar sequence. 
-/

def is_hex_kaprekar (n : ℕ) (base_val : ℕ) : Prop :=
  let sq := n * n
  (sq / base_val) + (sq % base_val) = n

theorem proof_255 : is_hex_kaprekar 255 256 := by
  unfold is_hex_kaprekar
  -- norm_num executes the arithmetic verification
  norm_num

/- 
Note: This logic scales to any (16^k - 1) boundary. 
The GitHub 'search.sage' confirms this empirically for k=1, 2, 3, 4, 5.
-/
