#lang racket

(provide (all-defined-out))

; https://bit.ly/3ef2VPJ
; listof(val)
(define b1 
  '( 0 1 6 4 0 0 0 0 0 
     2 0 0 0 0 9 0 0 0 
     4 0 0 0 0 0 0 6 2 
     0 7 0 2 3 0 1 0 0 
     1 0 0 0 0 0 0 0 3 
     0 0 3 0 8 7 0 4 0 
     9 6 0 0 0 0 0 0 5 
     0 0 0 8 0 0 0 0 7 
     0 0 0 0 0 6 8 2 0 ))

(define b2
  '( 0 4 9 0 0 8 6 0 5 
     0 0 3 0 0 7 0 0 0 
     0 0 0 0 0 0 0 3 0 
     0 0 0 4 0 0 8 0 0 
     0 6 0 8 1 5 0 2 0 
     0 0 1 0 0 9 0 0 0 
     0 1 0 0 0 0 0 0 0 
     0 0 0 6 0 0 4 0 0 
     8 0 4 5 0 0 3 9 0 ))

(define b3
  '( 7 6 0 5 0 0 0 0 0 
     0 0 0 0 6 0 0 0 8 
     0 0 0 0 0 0 4 0 3 
     2 0 0 4 0 0 8 0 0 
     0 8 0 0 0 0 0 3 0 
     0 0 5 0 0 1 0 0 7 
     8 0 9 0 0 0 0 0 0 
     6 0 0 0 1 0 0 0 0 
     0 0 0 0 0 3 0 4 1 ))

(define b4
  '( 0 0 0 6 0 5 0 0 0 
     0 0 3 0 2 0 8 0 0 
     0 4 5 0 9 0 2 7 0 
     5 0 0 0 0 0 0 0 1 
     0 6 2 0 0 0 5 4 0 
     4 0 0 0 0 0 0 0 7 
     0 9 8 0 6 0 4 5 0 
     0 0 6 0 4 0 7 0 0 
     0 0 0 2 0 3 0 0 0 ))

(define b5
  '( 4 0 9 0 0 0 7 0 5 
     0 0 0 0 1 0 0 0 0 
     0 0 6 2 0 7 8 0 0 
     2 0 0 0 0 0 0 0 9 
     0 0 3 7 0 4 2 0 0 
     8 0 0 0 0 0 0 0 4 
     0 0 2 8 0 1 5 0 0 
     0 0 0 0 6 0 0 0 0 
     9 0 5 0 0 0 4 0 6 ))

(define b6
  '( 0 0 0 0 1 0 0 3 0 
     0 4 0 0 7 0 5 0 1 
     0 0 2 0 0 8 0 0 6 
     6 8 0 0 0 0 0 0 3 
     0 0 0 3 0 2 0 0 0 
     3 0 0 0 0 0 0 4 5 
     2 0 0 5 0 0 8 0 0 
     8 0 1 0 4 0 0 2 0 
     0 9 0 0 2 0 0 0 0 ))

(define b7
  '( 0 8 0 0 7 0 0 3 0 
     2 6 0 0 5 0 0 1 8 
     0 0 0 0 0 0 4 0 0 
     0 0 0 6 0 2 0 0 0 
     3 9 0 0 1 0 0 8 6 
     0 0 0 7 0 9 0 0 0 
     0 0 4 0 0 0 8 0 0 
     8 1 0 0 4 0 0 5 2 
     0 5 0 0 9 0 0 7 0 ))

(define b8
  '( 0 0 0 0 9 3 0 0 6 
     0 0 0 8 0 0 9 0 0 
     0 2 0 0 0 6 1 0 0 
     0 0 0 0 8 0 0 5 3 
     0 0 6 0 0 0 2 0 0 
     3 7 0 0 5 0 0 0 0 
     0 0 2 5 0 0 0 4 0 
     0 0 1 0 0 9 0 0 0 
     7 0 0 1 3 0 0 0 0 ))

; Gordon Royle's web page: https://bit.ly/2WXNExd
; See also sudoko17 text file in the repo.
(define b9
  '( 0 0 0 0 0 0 0 1 0 
     4 0 0 0 0 0 0 0 0 
     0 2 0 0 0 0 0 0 0 
     0 0 0 0 5 0 4 0 7 
     0 0 8 0 0 0 3 0 0 
     0 0 1 0 9 0 0 0 0 
     3 0 0 4 0 0 2 0 0 
     0 5 0 1 0 0 0 0 0 
     0 0 0 8 0 6 0 0 0 ))

(define b10
  '( 0 0 0 0 0 0 0 1 0 
     4 0 0 0 0 0 0 0 0 
     0 2 0 0 0 0 0 0 0 
     0 0 0 0 5 0 6 0 4 
     0 0 8 0 0 0 3 0 0 
     0 0 1 0 9 0 0 0 0 
     3 0 0 4 0 0 2 0 0 
     0 5 0 1 0 0 0 0 0 
     0 0 0 8 0 7 0 0 0 ))

; The most difficult puzzle by Arto Inkala
; https://bit.ly/36Boc3T
(define b11
  '( 0 0 5 3 0 0 0 0 0
     8 0 0 0 0 0 0 2 0
     0 7 0 0 1 0 5 0 0
     4 0 0 0 0 5 3 0 0
     0 1 0 0 7 0 0 0 6
     0 0 3 2 0 0 0 8 0
     0 6 0 5 0 0 0 0 9
     0 0 4 0 0 0 0 3 0
     0 0 0 0 0 9 7 0 0 ))

; listof(listof(pos))
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

; listof(listof(pos))
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

; listof(listof(pos))
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

; listof(blocks) = listof(listof(pos))
(define blocks
  (append rows cols squares))

; board -> board | false
(define (solve-sudoku b)
  ; board -> board | false
  (define (solve-b b)
    (if (solved? b)
	b
	(solve-lob (create-new-boards b))))

  ; board -> board | false
  (define (solve-lob lob)
    (cond [(empty? lob) #f]
	  [else
	    (or (solve-b (first lob))
		(solve-lob (rest lob)))]))
  (solve-b b))

; board -> bool
(define (solved? b)
  (not (ormap zero? b)))

; board -> listof(board)
(define (create-new-boards b)
  (let ([next-pos (find-next-hole b)])
    (new-boards b next-pos)))

; board -> pos
; board = listof(pos)
(define (find-next-hole b)
  (let ([lop (find-all-holes b)])
    (find-hole-with-best-heuristic b lop)))

; board -> listof(pos)
(define (find-all-holes b)
  (define (find-all-holes-accs b res idx)
    (cond [(empty? b) res]
	  [else
	    (if (zero? (first b))
		(find-all-holes-accs (rest b) (cons idx res) (add1 idx))
		(find-all-holes-accs (rest b) res (add1 idx)))]))
  (find-all-holes-accs b '() 0))

; board listof(pos) -> pos
(define (find-hole-with-best-heuristic b lop)
  (define (best-heuristic-pos lop cur-best-pos cur-best-heuristic)
    (cond [(empty? lop) cur-best-pos]
	  [else
	    (let* ([positions (flatten (get-valid-blocks (first lop)))]		; listof(pos)
		   [lov (map (lambda(pos)					; listof(val)
			       (list-ref b pos))
			     positions)]
		   [heuristic (length (filter					; how many values are already in this row, col, square?
					(lambda(v) (not (zero? v)))
					lov))])
	      (if (> heuristic cur-best-heuristic)
		  (best-heuristic-pos (rest lop) (first lop) heuristic)
		  (best-heuristic-pos (rest lop) cur-best-pos cur-best-heuristic)))]))
  (best-heuristic-pos lop -1 -1))

; board pos -> listof(board)
(define (new-boards b p)
  (filter (lambda(b) (not (false? b))) ; filter out invalid new boards
	  (build-list 9 (lambda(i)
			  (new-board-or-false b p (add1 i))))))

; board pos value -> board | #f
(define (new-board-or-false b p v)
  (let* ([new-board (append (take b p)			   			; listof(pos)
			    (list v)
			    (drop b (add1 p)))]
	 [lob (get-valid-blocks p)]				      		; listof 3 blocks = listof(listof(pos))
	 [lolov (map (lambda(block)				     		; listof(listof(val)) -- (size = 3); block = listof(pos)
		       (map (lambda(p) (list-ref new-board p))
			    block))
		     lob)]
	 [lolov-wo-zeros (map (lambda(lov)					; listof(listof(val)) -- (size = 3) 
				(filter (lambda(v)			
					  (not (zero? v)))
					lov))
			      lolov)]
	 [valid-new-board? (andmap (lambda(lov)
				     (= (length lov) 
					(length (remove-duplicates lov))))
				   lolov-wo-zeros)])
    (if valid-new-board?
	new-board
	'#f)))

; pos -> listof(listof(pos))
; should be a list of three blocks - one for each row, col, square 
(define (get-valid-blocks p)
  (filter (lambda(lop) (member p lop))
	  blocks))

; (solve-sudoku b11)
