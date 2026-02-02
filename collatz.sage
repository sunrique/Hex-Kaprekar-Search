# =============================================================================
# FILE: collatz.sage
# AUTHOR: Enrique Coello-montoya
# DATE: February 2026
# DESCRIPTION: Statistical analysis of the Collatz (3n+1) Parity Drift.
# Calculates the Geometric Mean of multipliers to identify structural decay.
# =============================================================================

def analyze_collatz_drift(seed, steps=1000):
    """
    Tracks the 'Gravity' of the Collatz orbit for a given seed.
    If the Geometric Mean is < 1.0, the sequence is structurally forced to decay.
    """
    val = Integer(seed)
    multipliers = []
    
    for i in range(steps):
        if val == 1: break
        
        old_val = val
        if val % 2 == 0:
            val //= 2
            multipliers.append(0.5)
        else:
            val = 3*val + 1
            multipliers.append(float(val / old_val))
            
    # Calculate Geometric Mean
    log_sum = sum(log(m) for m in multipliers)
    g_mean = exp(log_sum / len(multipliers))
    
    print(f"Analysis for Seed: {seed}")
    print(f"Steps tracked: {len(multipliers)}")
    print(f"Geometric Mean (Decay Constant): {float(g_mean):.5f}")
    
    if g_mean < 1.0:
        print("RESULT: Structural Decay confirmed (Gravity wins).")
    else:
        print("RESULT: Divergence detected (Information grows).")

if __name__ == "__main__":
    # Test a 'Mundane' seed
    analyze_collatz_drift(20252026)
