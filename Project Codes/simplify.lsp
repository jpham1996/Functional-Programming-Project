; Choice:  #1, Simplified Operation.  
; Multiple functions is required to simplify an operation list.  


; Function remove-one-or-zero: 
; One or zero are key elements. 
; In multiplication, one is removed. 
; In addition, zero is removed. 
; Other operands are kept in place.  
(defun remove-one-or-zero (operands key) ; Function remove-one-or-zero starts.  
 (flet ; flet starts. 
 ; flet:  bindings are recursive, and cannot refer to each other. 
  ( ; Case starts. 
   (is-one-or-zero (element) (equal element key)) 
   ; Check if the element is equal to key. 
   ; In multiplication, one is the key. 
   ; In addition, zero is the key. 
  ) ; Case ends. 
  (let ((filtered-operands (remove-if #'is-one-or-zero operands)))
    (or filtered-operands (list key))
  ) ; Filters operands. 
 ) ; flet ends. 
) ; Function remove-one-or-zero ends. 


; Function operation-simplification: 
; Ensure that there is only one operator that's being processed. 
(defun operation-with-one-operand (lis) ; Function operation-simplification starts. 
 (let ; Let starts. 
  ( ; Case starts. 
   (operands (cdr lis)) 
  ) ; Case ends. 
  (if (cdr operands) lis (car operands)) 
 ) ; Let ends. 
) ; Function operation-simplification ends. 


; Function operation-simplification:  
; A function that gets call from simplify, 
(defun operation-simplification (operator operands key) ; Function operation-simplification starts. 
 ; Function operation-simplification starts. 
 ; Takes three arguments, operator, operands, and key. 
 (operation-with-one-operand ; Call starts. 
  (cons operator (remove-one-or-zero operands key)) 
 ) ; Call ends. 
 ; Calls the function operation-simplification, 
 ; within the call, it has another call, 
 ; which constructs a list goes through another function operation-with-one-operand. 
 ; Key elements (one or zero) need to be removed from the list, 
 ; before we check if there is only one operand for the operation.  
 
)  ; Function operation-simplification ends. 


; Function simplify:
; it's a function that decides the output based on argument.  
(defun simplify (lis) ; Function simplify starts.  
 (if (listp lis) ; If starts. 
 ; If lis is a list, do the following:  
  (let ; Let starts. 
   
   (
    (operator (car lis))
    (operands (mapcar #'simplify (cdr lis)))
   )
   ; Let operand be first element of the list lis and 
   ; operands be rest of the elements in the list. 
   ; mapcar is used instead of car because
   ; operates on successive elements of the lists. 
   ; In this case, mapcar is used because we want 
   ; the current form of the function simplify. 
   
   (cond ; Starts condition. 

	( ; Case 1 starts.  
	 (equal operator '+) 
	 ; First element is the operator "+", which starts an addition. 
	 (operation-simplification '+ operands 0)
	 ; Calls function "operation-simplification" and 
	 ; passes the three arguments as in the following order:  
	 ; first argument:  + as operator, 
	 ; second argument:  operands as operands, 
	 ; and third argument:  0 as a key, key is an identifier element . 
	) ; Case 1 ends. 
	
    ( ; Case 2 starts. 
	 (equal operator '*)
	 ; First element is the operator "*", which starts an multiplication. 
     (if ; If starts. 
	  (find 0 operands) ; Finds if there are any 0 operands. 
      0 
	  ; If there are any zero operands, then the list became zero, 
	  ; Since any thing multiply by zero is zero.  
      (operation-simplification '* operands 1)
	  ; Otherwise, calls the function "operation-simplification" and
	  ; passes the three arguments as in the following order: 
	  ; first argument:  * as operator, 
	  ; second argument:  operands as operands, 
	  ; and third argument:  1 as a key, key is an identifier element.  
	 ) ; If ends. 
	) ; Case 2 ends. 
	
	(t (error "Error!  This is not a valid operation!"))
	; Default case, if it doesn't meet case 1 or case 2, it goes here.  
	; In this case, the operator or first element is not + or *, 
	; which means it won't initiate a multiplication or addition.  
	
   ) ; Ends condition. 
   
  ) ; Let ends. 
  lis ; Calls the lis again to print out the new lis.  
 ) ; If ends. 
) ; Function simplify ends.  