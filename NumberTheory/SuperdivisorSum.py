"""
Author: Jaroslav Podmajerský
Date: 29.4.2025
"""

def superdelitel(k):
    if k <= 1:
        return 0
    for d in range(k // 2, 0, -1):
        if k % d == 0:
            return d
    return 1

def s(n):
    total = 0
    while n != 0:
        total += n
        n = superdelitel(n)
    return total

reseni = []
for n in range(1, 2026):
    if s(n) == 2025:
        reseni.append(n)

print("Solution that satisfies:")
print(reseni)
