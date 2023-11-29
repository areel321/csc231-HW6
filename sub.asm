;;; sub.asm
;;; Allison Reel
;;;


                extern  _printDec
                extern  _printInt
                extern  _printString
                extern  _println
                extern  _getInput

                section .data
prompt          db      "> "
promptLen       equ     $-prompt
ansStr          db      "ans = "
ansStrLen       equ     $-ansStr

;;; declare 5 16-bit short ints
x               dw      1       ; leave these values in
y               dw      2       ; the different variables.
z               dw      3       ; Moodle will use this to
t               dw      4       ; verify that you haven't
ans             dw      5       ; modified the original data
                                ; segment

                section .text
                global  _start
_start:
        ;; display prompt
                mov     ecx, prompt
                mov     edx, promptLen
                call    _printString
        ;; get x
                call    _getInput
                mov     word[x], ax

        ;; display prompt
                mov     ecx, prompt
                mov     edx, promptLen
                call    _printString
        ;; get y
                call    _getInput
                mov     word[y], ax

        ;; display prompt
                mov     ecx, prompt
                mov     edx, promptLen
                call    _printString
        ;; get z
                call    _getInput
                mov     word[z], ax

        ;; display prompt
                mov     ecx, prompt
                mov     edx, promptLen
                call    _printString
        ;; get t
                call    _getInput
                mov     word[t], ax

;; -----------------------------------
;; computation: ans = 3*((t-1)+2*(y-t)) - 3*(x-10)
;; -----------------------------------


        ;; *** YOUR CODE GOES HERE ***
        mov ax, 0
        mov bx, 0
        mov cx, 0
        mov dx, 0
        
        
        ;y-t
        mov ax, word[y]     ;ax <- y
        sub ax, word[t]     ;ax <- ax - t
        
        ;t-1
        sub word[t], 1           ;t <- t - 1
        
        ;x-10
        sub word[x], 10         ;x <- x - 10
        
        ;2*y
        add ax, ax              ;ax <- ax + ax
        
        ;t+y
        add ax, word[t]         ;ax <- ax + word[t]
        
        ;3*t
        add bx, ax              ; bx <- bx + ax
        add bx, ax              ; bx <- bx + ax
        add bx, ax              ; bx <- bx + ax
        
        ;3*x
        add cx, word[x]         ; cx <- cx + x
        add cx, word[x]         ; cx <- cx + x
        add cx, word[x]         ; cx <- cx + x
        
        ;t-x
        sub bx, cx              ; bx <- bx - cx
        
        
        mov word[ans], bx

        
;; -----------------------------------
;; display "ans = "
;; -----------------------------------
                mov     ecx, ansStr
                mov     edx, ansStrLen
                call    _printString

;; -----------------------------------
;; display ans variable
;; -----------------------------------
                mov     eax, 0
                mov     ax, word[ans]
                call    _printInt
                call    _println
                call    _println

;;; exit
                mov     ebx, 0
                mov     eax, 1
                int     0x80
