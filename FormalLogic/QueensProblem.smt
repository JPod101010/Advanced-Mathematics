; run with
;
;   $ z3 -smt2 queens.smt
 
; declare the sorts of pos --- pos represents the chessboard (an 8x8 array) ,
; indexed by "(pos row column)":
; true  --- a queen is on [row, column]
; false --- a queen is not on [row, column]
(declare-fun pos (Int Int) Bool)
 
; a helper function that checks that 1 <= x <= 8
(define-fun is-in-range ((x Int)) Bool (and (> x 0) (<= x 8)))
 
; first, we say that in all rows, there is at least one queen 
(assert (forall ((i Int)) (=> (is-in-range i) (exists ((j Int)) (and (is-in-range j) (pos i j)) ))))
; second, we say that if a queen is on [k; l], then there is no queen on any [m; l] (for m != k) and on any [k; m] (for m != l)
(assert (forall ((k Int)) (forall ((l Int)) (=> (is-in-range k) (=> (pos k l) (forall ((m Int)) (=> (is-in-range m) (and (=> (not (= m k)) (not (pos m l))) (=> (not (= m l)) (not (pos k m))))))) ))))
  
(declare-const y-pos-a Int)
(declare-const y-pos-b Int)
(declare-const y-pos-c Int)
(declare-const y-pos-d Int)
(declare-const y-pos-e Int)
(declare-const y-pos-f Int)
(declare-const y-pos-g Int)
(declare-const y-pos-h Int)
 
; ADD YOUR CONSTRAINTS HERE
;============================= START ==============
; Diagonal constraints using pairwise comparisons for each pair of queens
(assert (not (= 1 (* (- y-pos-a y-pos-b) (- y-pos-a y-pos-b)))))
(assert (not (= 4 (* (- y-pos-a y-pos-c) (- y-pos-a y-pos-c)))))
(assert (not (= 9 (* (- y-pos-a y-pos-d) (- y-pos-a y-pos-d)))))
(assert (not (= 16 (* (- y-pos-a y-pos-e) (- y-pos-a y-pos-e)))))
(assert (not (= 25 (* (- y-pos-a y-pos-f) (- y-pos-a y-pos-f)))))
(assert (not (= 36 (* (- y-pos-a y-pos-g) (- y-pos-a y-pos-g)))))
(assert (not (= 49 (* (- y-pos-a y-pos-h) (- y-pos-a y-pos-h)))))

(assert (not (= 1 (* (- y-pos-b y-pos-c) (- y-pos-b y-pos-c)))))
(assert (not (= 4 (* (- y-pos-b y-pos-d) (- y-pos-b y-pos-d)))))
(assert (not (= 9 (* (- y-pos-b y-pos-e) (- y-pos-b y-pos-e)))))
(assert (not (= 16 (* (- y-pos-b y-pos-f) (- y-pos-b y-pos-f)))))
(assert (not (= 25 (* (- y-pos-b y-pos-g) (- y-pos-b y-pos-g)))))
(assert (not (= 36 (* (- y-pos-b y-pos-h) (- y-pos-b y-pos-h)))))

(assert (not (= 1 (* (- y-pos-c y-pos-d) (- y-pos-c y-pos-d)))))
(assert (not (= 4 (* (- y-pos-c y-pos-e) (- y-pos-c y-pos-e)))))
(assert (not (= 9 (* (- y-pos-c y-pos-f) (- y-pos-c y-pos-f)))))
(assert (not (= 16 (* (- y-pos-c y-pos-g) (- y-pos-c y-pos-g)))))
(assert (not (= 25 (* (- y-pos-c y-pos-h) (- y-pos-c y-pos-h)))))

(assert (not (= 1 (* (- y-pos-d y-pos-e) (- y-pos-d y-pos-e)))))
(assert (not (= 4 (* (- y-pos-d y-pos-f) (- y-pos-d y-pos-f)))))
(assert (not (= 9 (* (- y-pos-d y-pos-g) (- y-pos-d y-pos-g)))))
(assert (not (= 16 (* (- y-pos-d y-pos-h) (- y-pos-d y-pos-h)))))

(assert (not (= 1 (* (- y-pos-e y-pos-f) (- y-pos-e y-pos-f)))))
(assert (not (= 4 (* (- y-pos-e y-pos-g) (- y-pos-e y-pos-g)))))
(assert (not (= 9 (* (- y-pos-e y-pos-h) (- y-pos-e y-pos-h)))))

(assert (not (= 1 (* (- y-pos-f y-pos-g) (- y-pos-f y-pos-g)))))
(assert (not (= 4 (* (- y-pos-f y-pos-h) (- y-pos-f y-pos-h)))))

(assert (not (= 1 (* (- y-pos-g y-pos-h) (- y-pos-g y-pos-h)))))
;============================= END ================

(assert (and (is-in-range y-pos-a) (pos 1 y-pos-a)))
(assert (and (is-in-range y-pos-b) (pos 2 y-pos-b)))
(assert (and (is-in-range y-pos-c) (pos 3 y-pos-c)))
(assert (and (is-in-range y-pos-d) (pos 4 y-pos-d)))
(assert (and (is-in-range y-pos-e) (pos 5 y-pos-e)))
(assert (and (is-in-range y-pos-f) (pos 6 y-pos-f)))
(assert (and (is-in-range y-pos-g) (pos 7 y-pos-g)))
(assert (and (is-in-range y-pos-h) (pos 8 y-pos-h)))
 
(check-sat)
(get-model)
