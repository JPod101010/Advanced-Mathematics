"""
Author: Jaroslav Podmajerský
Date: 2.3.2025
Description: This script creates logical clauses for the 'queens problem' on a NxN chessboard.
Run: $ python xpodmaj00.py N | minisat
"""

import sys
from itertools import combinations

def main():
    if len(sys.argv) != 2:          # Argument count check
        sys.exit(1) 
    if not sys.argv[1].isdigit():   # Argument type check
        sys.exit(1)
    N = int(sys.argv[1])            # Argument value check
    if N < 1:
        sys.exit(1)
    clauses = []
    
    # Rows
    for r in range(N):
        row_vars = [r * N + c + 1 for c in range(N)]
        clauses.append(row_vars)
        for v1, v2 in combinations(row_vars, 2):
            clauses.append([-v1, -v2])
    
    # Columns
    for c in range(N):
        col_vars = [r * N + c + 1 for r in range(N)]
        for v1, v2 in combinations(col_vars, 2):
            clauses.append([-v1, -v2])
    
    # Diagonals
    left_diags = {}
    right_diags = {}
    for r in range(N):
        for c in range(N):
            var = r * N + c + 1
            key_left = r - c
            key_right = r + c
            if key_left not in left_diags:
                left_diags[key_left] = []
            left_diags[key_left].append(var)
            if key_right not in right_diags:
                right_diags[key_right] = []
            right_diags[key_right].append(var)
    
    for diag in left_diags.values():
        for v1, v2 in combinations(diag, 2):
            clauses.append([-v1, -v2])
    for diag in right_diags.values():
        for v1, v2 in combinations(diag, 2):
            clauses.append([-v1, -v2])
    
    # Output DIMACS format
    num_vars = N * N
    num_clauses = len(clauses)
    print(f"p cnf {num_vars} {num_clauses}")
    for clause in clauses:
        print(" ".join(map(str, clause)) + " 0")

if __name__ == "__main__":
    main()
