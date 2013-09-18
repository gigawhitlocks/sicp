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
	(* x (factorial (- x 1))))))
(factorial 3)
(factorial 100)

(define factorial
  (lambda (n)
    (fact-iter 1 1 n)))

(define fact-iter
  (lambda (product counter max-count)
    (if (> counter max-count)
	product
	(fact-iter (* counter product)
		   (+ counter 1)
		   max-count))))

(time (factorial 1000))


; -- hey let's implement fizzbuzz
;    just for shits
;    I don't remember if the normal implementation
;    is 1-100 inclusive or 1-99 inclusive; this one
;    goes to 100 inclusive

; this is a default-args wrapper
(define fizzbuzz
  (lambda ()
    (fizzbuzz-iter 1 100)))

(define fizzbuzz-iter
  (lambda (iter max)

    ; the actual meat of fizzbuzz
    (cond [(and (= (remainder iter 5) 0) 
		(= (remainder iter 3) 0)) (printf "FizzBuzz\n")]
	  [(= (remainder iter 5) 0) (printf "Buzz\n")]
	  [(= (remainder iter 3) 0) (printf "Fizz\n")]
	  [else (printf "~a\n" iter)])

    ; call the iterator
    (if (< iter max) 
	(fizzbuzz-iter (+ 1 iter) max) 
	(printf "\n"))))
    
(fizzbuzz)

; Exercise 1.11

(define ex1.11
  (lambda (n)
    (if (< n 3)
	n
	(+ (* 2 (ex1.11 (- n 2))) 
	   (* 3 (ex1.11 (- n 3)))
	   (ex1.11 (- n 1))))))



(ex1.11 2) ; 2
(ex1.11 3) ; 4 ; f(3) = f(2) + 2*f(1) + 3*f(0) = 2 + 2 + 0
(ex1.11 4) ; 11 ; f(4) = f(3) + 2*f(2) + 3*f(1) = 4 + 4 + 3 = 11
(ex1.11 10)

