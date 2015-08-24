; *********************************************
; *  314 Principles of Programming Languages  *
; *  Spring 2014                              *
; *  Author: Liu Liu                          *
; *          Ulrich Kremer                    *
; *  April 5, 2014                            *
; *********************************************
;; -----------------------------------------------------
;; ENVIRONMENT
;; contains "ctv", "vtc",and "reduce" definitions
;;(load "include.ss")

;; contains a test document consisting of three paragraphs. 
;;(load "document.ss");;Use Language R5RS

;; contains a test-dictionary, which has a much smaller dictionary for testing
;; the dictionary is needed for spell checking
;;(load "test-dictionary.ss")

;;(load "dictionary.ss") ;; the real thing with 45,000 words


;; -----------------------------------------------------
;; HELPER FUNCTIONS
;;Encode-p maps a function to a list
;;INPUT: a function and a list
;;OUTPUT: the list after the passed function was applied to all elements
(define encode-p
  (lambda (f l)
    (if (null? l) '()
        (cons (f (car l)) (map f (cdr l))))
    ))

;;Check-p checks to see if a given value for n works for every word
;;INPUT: a paragraph and a value for n
;;OUTPUT: true or false
(define check-p
  (lambda (p n)
    (if (null? p) '()
    (if (and (spell-checker (car (encode-p (encode-n n) p)))
             (check-p (cdr p) n))
    #t #f))
    ))

;;Test-num is used in by Gen-Decoder-A to run through all values for n 
;;it passes n off to check-p to see if it works
;;INPUT: a paragraph and a starting value for n
;;OUTPUT: a working value for n (it returns error if no values work)
(define test-num
  (lambda (p n)
    (if (= n 28) 'error 
        (if (check-p p n) n
            (test-num p (+ 1 n))))
    ))

;;CountX counts the number of times an atom is in a list
;;INPUT: a list and the item to be search for
;;OUTPUT: how many times that item is in the list
(define countX
  (lambda (l x)
    (if (null? l) 0
        (cond
          ((eq? (car l) x) (+ 1 (countX (cdr l) x)))
          (else (countX (cdr l) x))))
    ))

;;Highest finds the most frequently occurring atom in a list
;;INPUT: a list, a value, the number of times that value appears
;;OUTPUT: The most frequent value in the list
(define maxCount
  (lambda (l)
    (reduce max (map (lambda (x) (countX  l x)) l) 0)      ;;USES REDUCE FUNCTION!!!
    ))

;;Highest finds the how many times the most frequently occurring atom
;;appears in a list
;;INPUT: a list and an atom
;;OUTPUT: a number value
(define highest
  (lambda (l x)
    (if (null? l) '()
        (cond
          ((eq? (countX l (car l)) x) (car l))
          (else (highest (cdr l) x))))
    ))

;;Flaten combines many nested list into one big list
;;INPUT: a list with many possible sublists
;;OUTPUT: a singly nested list
(define flatten
  (lambda (l)
    (if (null? l) '()
        (if (list? (car l)) 
            (append (flatten (car l)) (flatten (cdr l)))
            (cons (car l) (flatten (cdr l)))))
    ))

;;eOffset takes in a number and returns the numbers offset from e
;;INPUT: a number
;;OUTPUT: the distance of that a given number from e
(define eOffset
  (lambda (x)
    (cond ((> x 4) (- 4 x))
          ((< x 4) (- 4 x))
          ((= x 4) 0))
    ))


;; -----------------------------------------------------
;; SPELL CHECKER FUNCTION

;;check a word's spell correctness
;;INPUT:a word(a global variable "dictionary" is included in the file "test-dictionary.ss", and can be used directly here)
;;OUTPUT:true(#t) or false(#f)
(define spell-checker 
  (lambda (w)
    (if (member w dictionary) #t #f)
   ))

;; -----------------------------------------------------
;; ENCODING FUNCTIONS

;;generate an Caesar Cipher single word encoders
encode-n Takes in a word and returns the encoded word
;;INPUT:a number "n"
;;OUTPUT:a function, whose input=a word, output=encoded word
(define encode-n
  (lambda (n);;"n" is the distance, eg. n=3: a->d,b->e,...z->c
    (lambda (w);;"w" is the word to be encoded
      (map
       (lambda (c)(vtc (modulo (+ (ctv c) n) 26)))
       w)
      )))

;;encode a document
;;INPUT: a document "d" and an "encoder"
;;OUTPUT: an encoded document using a provided encoder
(define encode-d;;this encoder is supposed to be the output of "encode-n"
  (lambda (d encoder)
    (if (null? d) '()
        (cons (encode-p encoder (car d)) 
              (encode-d (cdr d) encoder)))
    ))

;; -----------------------------------------------------
;; DECODE FUNCTION GENERATORS
;; 2 generators should be implemented, and each of them returns a decoder

;;generate a decoder using brute-force-version spell-checker
;;INPUT:an encoded paragraph "p"
;;OUTPUT:a decoder, whose input=a word, output=decoded word
(define Gen-Decoder-A
  (lambda (p);;Takes a paragraph as an input
    (encode-n (test-num p 0))
    ))

;;generate a decoder using frequency analysis
;;INPUT:same as above
;;OUTPUT:same as above
(define Gen-Decoder-B
  (lambda (p)
    (encode-n (eOffset (ctv (highest (flatten p) (maxCount (flatten p))))))
    ))

;; -----------------------------------------------------
;; CODE-BREAKER FUNCTION

;;a codebreaker
;;INPUT: an encoded document(of course by a Caesar's Cipher), a decoder(generated by functions above)
;;OUTPUT: a decoded document
(define Code-Breaker
  (lambda (d decoder)
    (if (null? d) '()
        (cons (encode-p decoder (car d))
             (Code-Breaker (cdr d) decoder)))
     )) 

;; -----------------------------------------------------
;; EXAMPLE APPLICATIONS OF FUNCTIONS
;;(spell-checker '(h e l l o))
;;((encode-n 5) '(a b c))
;;(define add5 (encode-n 12))
;;(encode-d document add5)

;;(define encoder (encode-n 5))
;;(define testCase (encode-d document encoder))
;(define decoderSP1 (Gen-Decoder-A (car testCase)))
;;(define decoderFA1 (Gen-Decoder-B (car testCase)))

;;(Code-Breaker testCase decoderSP1)
;;(Code-Breaker testCase decoderFA1)
;;(display testCase)
