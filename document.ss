; *********************************************
; *  314 Principles of Programming Languages  *
; *  Spring 2014                              *
; *  Author: Liu Liu                          *
; *          Ulrich Kremer                    *
; *  April 5, 2014                            *
; *********************************************
;; -----------------------------------------------------

(define test-document '(
                        ((h e l l o));;paragraph1
                        ((t h i s)(i s)(t e s t));;paragraph2
                        ))


(define document '(
                   ((e e l s) (e v e n) (e n t e r) (e v e r y d a y))
                   ((t h i s)(c o u r s e)(c o v e r s)(t o p i c s)(i n)(p r o g r a m m i n g)(l a n g u a g e s)(a n d)(c o m p i l e r s));4e 5r
                   ((a t t r i b u t e)(g r a m m a r s)(a n d)(t h e i r)(u s e)(i n)(s y n t a x)(d i r e c t e d)(t r a n s l a t i o n));;5e 6r
                   ((m o d e l s)(o f)(p r o g r a m m i n g)(l a n g u a g e)(s e m a n t i c s));;3e 2r
                   ((i n t e r m e d i a t e)(r e p r e s e n t a t i o n s)(o f)(p r o g r a m s)(p a r a l l e l)(p r o g r a m m i n g)(m o d e e e l s));;10e 8r
                   ((e n t e r) (e x t r a) (e e l) (e v e n l y))
                   ((E N D))
                   ));;19 e's 19 r's

(define encoded-document '(
                    ((y m n x) (h t z w x j) (h t a j w x) (y t u n h x) (n s) (u w t l w f r r n s l) (q f s l z f l j x) (f s i) (h t r u n q j w x))
                    ((f y y w n g z y j) (l w f r r f w x) (f s i) (y m j n w) (z x j) (n s) (x d s y f c) (i n w j h y j i) (y w f s x q f y n t s))
                    ((r t i j q x) (t k) (u w t l w f r r n s l) (q f s l z f l j) (x j r f s y n h x))
                    ((n s y j w r j i n f y j) (w j u w j x j s y f y n t s x) (t k) (u w t l w f r x) (u f w f q q j q) (u w t l w f r r n s l) (r t i j j j q x))
                    ))

(define paragraph '((k y v) (v v c) (z j) (v m v i p) (v e k v i k r z e v i j) (x i v r k) (v j t r g r u v) (v m v i)))


(define paragraph2 '((t h e) (e e l) (i s) (e v e r y) (e n t e r t a i n e r s) (g r e a t) (e s c a p a d e) (e v e r) (e e e e e)))

(define encParagraph2 '((f t u e) (q q x) (u e) (q h q d k) (q z f q d f m u z q d e) (s d q m f) (q e o m b m p q) (q h q d)))