# =============================================================================
# FILE: search.sage
# AUTHOR: Enrique Coello-montoya
# DATE: February 2026
# DESCRIPTION: Exhaustive search for Hexadecimal Kaprekar Numbers (Base-16).
# A Kaprekar number n satisfies the property that n^2 in hexadecimal can be 
# split into two parts which sum back to n.
# =============================================================================

def find_hex_kaprekars(limit=1000000):
    """
    Scans integers up to the limit to identify Base-16 Kaprekar anomalies.
    Returns a list of matching integers.
    """
    print(f"--- Initiating Hex-Kaprekar Deep Scan: 0 to {limit} ---")
    results = [0, 1]
    
    # We use srange to ensure we are working with Sage Integers
    for n in srange(2, limit):
        # 1. Square the number
        sq = n^2
        
        # 2. Convert to Hexadecimal string (removing '0x')
        hex_str = sq.str(base=16).upper()
        d = len(hex_str)
        
        if d < 2: continue
            
        # 3. Test every possible split point i
        for i in range(1, d):
            left_part = hex_str[:i]
            right_part = hex_str[i:]
            
            # Convert parts back to integers
            L = Integer(left_part, base=16)
            R = Integer(right_part, base=16)
            
            # 4. The Kaprekar Condition
            # R must be non-zero to avoid trivial splits (e.g., n=10, n^2=100)
            if R > 0 and (L + R) == n:
                print(f"FOUND: {n} (Hex: {n.str(16).upper()}) | Split: {left_part} + {right_part}")
                results.append(n)
                break
                
    return results

# Execute and Print Final Output
if __name__ == "__main__":
    final_list = find_hex_kaprekars(1000000)
    print("\n--- FINAL DATA FOR OEIS SUBMISSION ---")
    print(", ".join(map(str, final_list)))
