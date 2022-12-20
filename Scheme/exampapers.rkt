#lang scheme

;January 2020 Exam
;. Define a Scheme function CROSS-MAP which takes a binary function
;F and two lists XS and YS, and returns a list of the result of applying F
;to each possible pair of elements with the first taken from XS and the
;second from YS. (Order of elements in output is unspecified.)
;Example:(cross-map - '(100 200 300) '(4 3 2 1)) ⇒ ( 96 97 98 99 196 197 198 199 296 297 298 299)

(define (crossmap L1 L2)
  (for*/list ((i (in-list L1)) (j (in-list L2)))
    (- i j)))

;Jan 2019 Exam
;Define a Scheme function SCATTER-GATHER which takes two
;arguments, a list INDICES of indices and a list VALS of values,
;and returns a list of the same length as INDICES but with each
;value K replaced by the K-th element of VALS, or if that is out of range, by#f.
;Example:(scatter-gather '(0 1 4 1 1 7 2) '(a b c d e))=> (a b e b b #f c)

(define (scatterGather indices values)
  (cond ((null? indices) '())  ;always do this check  '() -> return empty list
        ((<(car indices)(length values)) 
        (cons (list-ref values (car indices))(scatterGather (cdr indices) values)))  ;list-ref we pass in the list first and then the value
        (else (cons '#f(scatterGather (cdr indices) values)))))


;Jan 2018
;Define a Scheme function map-skip which takes a function and a
 ;list and returns the result of applying the given function to
 ;every other element of the given list, starting with the first element.
;(map-skip (λ (x) (+ x 1000)) '(1 2 3 4 5 6)) => (1001 2 1003 4 1005 6)
(define (map-skip func lst)
  (cond ((null? lst) '())  ;check is list is empty
  (else (cons (func (car lst)) (cons (cadr lst) (map-skip func (cddr lst)))))))


;August 2017
;Define a Scheme function foo that takes two lists and yields a list combining all the
;elements in the two input lists, taking 1 from the first list, 2 from the second list, 3 from
;the first list, 4 from the second list, etc, until both are exhausted.
;Examples:
;(foo '(a b c d e f g) '(aa bb cc dd ee ff gg)) => (a aa bb b c d cc dd ee ff e f g gg)

(define (foo l1 l2)
      (if (null? l1) l2
          (if (null? l2) l1
              (cons (car l1) (cons (car l2) (foo (cdr l1) (cdr l2)))))))

;2016 Autumn
;Define a function tr which takes a list of lists, all of the same
;length, and returns their "transpose", meaning a list of lists of
;the first elements, the second elements, etc. (All lists in test
;cases can be assumed to be non-empty.)
;Example 1:(tr '((1 2 3) (4 5 6))) => ((1 4) (2 5) (3 6))
;Example 2 (tr '((f o x e s) (s o c k s) (r o c k s))) => ((f s r) (o o o) (x c c) (e k k) (s s s))

(define (tr l1)
  (cond ((null? (car l1)) '())
        (else (cons (map car l1) (tr (map cdr l1))))))

;Define a Scheme function reverse-with-count which takes two lists, the second of which is a list of non-negative integers the
;same length as the first list, and returns a list of elements from the first list, in reverse order, each repeated a number of time
;as specified by the corresponding element of the second list.
;Examples: (reverse-with-count '(a b c) '(1 2 3)) => (c c c b b a)

(define reverse-with-count
  (λ (p q)
    (cond
      ((null? p) '())
      ((= (car q) 0) (reverse-with-count (cdr p) (cdr q)))
      (else
       (append
        (reverse-with-count p (cons
                               (- (car q) 1)
                               (cdr q)))
        (cons (car p) '()))))))
         