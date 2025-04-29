# General solution of the prime remainder problem
## Autor: Jaroslav Podmajerský
## Problem
When dividing a certain natural number by 20 and 25, the remainders are prime numbers. The sum of both incomplete quotients equals 2025. Determine the dividend. Find all solutions.
## Generic solution
Let $a,b$ and $S$ be our input, where $S$ is the sum we are trying to get, $a$ and $b$ are our numbers (in the example problem we let $S=2025, a=20$ and $b=25$).

Define $X$ as a set of all possible solutions. Then we can rewrite the problem as :

$$
\left\lfloor \frac{x_0}{a} \right\rfloor + \left\lfloor \frac{x_0}{b} \right\rfloor = S
$$

$$
    x_0 \text{ mod } a = p \newline
    x_0 \text{ mod } b = p
$$
Where $x_0 \in X$, $p \in P$, where $P$ is a set of all primes

Furthermore we define sets of all primes lesser than the values $a$ and $b$, noted 
$$
p_i \in A : p_i \in P \land p_i < a , \newline p_i \in B : p_i \in P \land p_i < b 
$$
Continuing with our solution we restrict the boundry of all emelents from $X$ by solving the following inequality:
$$
\frac{x_0}{a} + \frac{x_0}{b} \geq S
$$
$$
x_0 \geq \frac{S \cdot a \cdot b}{a+b}
$$
Following with the upper bound restriction: Suppose that $a<b$ then we can say that all elements of $X$ are bounded between the lower bound and the lower bound +$ a$, because if the solution would be bigger we would not hold the equality from the beginning:
$$
    \frac{S \cdot a \cdot b}{b+a} \leq x_0 < \frac{S \cdot a \cdot b}{b+a} +a
$$

Note: In our example this inequality restricts the variables to: $$22500 < x_0 < 22520$$ $$A = \left\{2,3,5,7,11,13,17,19 \right\}  $$
$$B = \left\{2,3,5,7,11,13,17,19,23 \right\}$$


Knowing this we can also reduce the sets $A$ and $B$ to a final set $X_p$ that will hold the intersection of the sets, because no prime larger than the largest prime in the smaller set can exist as a remainder. In our case:
$$
    X_p = A \cap B = \left\{2,3,5,7,11,13,17,19 \right\}
$$
Finally the solution set $X$ will contain all elements which suffix (the last digits) are an element of the $X_p$ and are respect the boudries. In our case :
$$
    X = \left\{ 22502,22503,22505,22507,22511,22513,22517,22519 \right\}
$$
Generalized :
$$
    x_i \in X: \frac{S \cdot a \cdot b}{b+a} \leq x_i < \frac{S \cdot a \cdot b}{b+a} +a \space \land \space x_i \text{ mod } 10^{\text{len}(y_i)} \in X_p 
$$
Where $y_i$ is an element of $X_p$ and the function len($x$) returns the number of digits of $x$.