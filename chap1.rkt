; Chapter 1
; ———————————————————-


; a simple test function to
; dick around with defining functions
(define square
  (lambda (x)
    (* x x)))

; and some tests
(square 6)
(square 36) ; 1296
(square (square 2)) ; 16


(define factorial
  (lambda (x)
    (if (= x 1)
	1
	(* x (factorial (- x 1)))))) ; lol those parentheses

(factorial 3)
(factorial 100)
