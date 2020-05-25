# Installation
```
$ raco pkg install https://github.com/mkohlhaas/sudoku-solver.git
```
# Racket Usage
```
(require sudoku-solver)
(solve-sudoku 
   '(0 0 0 0 0 0 0 1 2
     7 0 0 0 6 0 0 0 0
     0 0 0 0 0 0 0 5 0
     0 8 0 2 0 0 0 0 0
     6 0 0 0 0 0 4 0 0
     0 0 0 1 0 9 0 0 0
     0 1 9 0 0 0 0 0 0
     0 0 0 0 3 0 8 0 0
     5 0 2 0 0 0 0 0 0))
```
# Run Tests
```
$ git clone https://github.com/mkohlhaas/sudoku-solver.git
$ raco test main.rkt
```
# Compile
```
$ raco exe -o sudoku main.rkt
```
# Use Binary
```
$ parallel sudoku :::: private/sudoku17.txt
```

