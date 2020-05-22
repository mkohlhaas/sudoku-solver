#lang racket

; https://bit.ly/3ef2VPJ
(define b1 '(0 1 6 4 0 0 0 0 0 2 0 0 0 0 9 0 0 0 4 0 0 0 0 0 0 6 2 0 7 0 2 3 0 1 0 0 1 0 0 0 0 0 0 0 3 0 0 3 0 8 7 0 4 0 9 6 0 0 0 0 0 0 5 0 0 0 8 0 0 0 0 7 0 0 0 0 0 6 8 2 0))

(define rows 
  '((  0  1  2  3  4  5  6  7  8 ) 
    (  9 10 11 12 13 14 15 16 17 ) 
    ( 18 19 20 21 22 23 24 25 26 ) 
    ( 27 28 29 30 31 32 33 34 35 ) 
    ( 36 37 38 39 40 41 42 43 44 ) 
    ( 45 46 47 48 49 50 51 52 53 ) 
    ( 54 55 56 57 58 59 60 61 62 ) 
    ( 63 64 65 66 67 68 69 70 71 ) 
    ( 72 73 74 75 76 77 78 79 80 )))

(define cols 
  '(( 0  9 18 27 36 45 54 63 72 )
    ( 1 10 19 28 37 46 55 64 73 )
    ( 2 11 20 29 38 47 56 65 74 )
    ( 3 12 21 30 39 48 57 66 75 )
    ( 4 13 22 31 40 49 58 67 76 )
    ( 5 14 23 32 41 50 59 68 77 )
    ( 6 15 24 33 42 51 60 69 78 )
    ( 7 16 25 34 43 52 61 70 79 )
    ( 8 17 26 35 44 53 62 71 80 )))

(define squares 
  '((  0  1  2  9 10 11 18 19 20 )
    (  3  4  5 12 13 14 21 22 23 )
    (  6  7  8 15 16 17 24 25 26 )
    ( 27 28 29 36 37 38 45 46 47 )
    ( 30 31 32 39 40 41 48 49 50 )
    ( 33 34 35 42 43 44 51 52 53 )
    ( 54 55 56 63 64 65 72 73 74 )
    ( 57 58 59 66 67 68 75 76 77 )
    ( 60 61 62 69 70 71 78 79 80 )))

; board -> board | false
(define (solve-b b)
  (if (solved? b)
      b
      (solve-lob (create-new-boards b))))

; board -> board | false
(define (solve-lob lob)
  (cond [(empty? log) #f]
	[else
	  (or (solve-b (first lob))
	      (solve-lob (rest lob)))]))

; board -> bool
(define (solved? b)
  (not (or-map zero? b)))

; board -> listof(board)
(define (create-new-boards b)
  (let [next-pos (find-next-hole b)]
    (keep-valid-boards
      (new-boards b next-pos)
      next-pos)))

; board -> pos
(define (find-next-hole b)
  (- (length b)
     (length (member 0 b))))

; board pos -> listof(board)
(define (new-boards b p)
  (build-list 9 (lambda(i)
		  (replace-board-value b p (add1 i)))))

; listof(board) pos -> listof(board)
(define (keep-valid-boards lob pos))

; board pos value -> board
(define (replace-board-value b p v)
  (append (take b p)
	  (list v)
	  (drop b (add1 pos))))

; board pos -> bool
(define (check-sudoku-rules b p)
  (let ([row (get-row p)]
	[col (get-col p)]
	[squ (get-square p)])
    (check-rows b)
    (check-cols b)
    (check-squares b)))

; pos -> listof(pos)
(define (get-row p))

; pos -> listof(pos)
(define (get-col p))

; pos -> listof(pos)
(define (get-square p))
