(defun add-numbers (lis)

 (cond
  ((null lis) 0)
  ; If list is empty, lis is 0. 
 
  ( ; Start of Case 1.  
   (numberp (car lis)) ; Case 1, if first element of lis is a number. 
   ( + (car lis) (add-numbers (cdr lis)))
   ; Add first element (number) of lis to rest of lis.
   ; Calls add-numbers again, 
   ; but pass back in a list without first element. 
  ) ; End of Case 1. 
  
  ( ; Start of Case 2.  
   (symbolp (car lis)) ; Case 2, if first element of lis is a number. 
   (+ 0 (add-numbers (cdr lis)))
   ; Add zero whenever it reads the first element as symbol. 
   ; Calls add-numbers again, 
   ; but pass back in a list without first element. 
   ; Thus, it nullifies the number that will be added later on. 
  ) ; End of Case 2. 

  ( ; Start of Case 3.  
   (listp (car lis)) ; Case 3, if first element of lis is a list. 
   ( + (add-numbers (car lis)) (add-numbers (cdr lis)))
   ; Calls add-numbers again, 
   ; but pass back in a list with only the first element, a sublist. 
   ; Add first element (sublist) of lis to rest of lis. 
   ; Calls add-numbers again, 
   ; but pass back in a list without first element.  
  ) ; End of Case 3. 

  (t (eval (cons '+ lis)))
  ; Case 4, or default case.  This is where first element isn't a number, symbol, or a list. 

 ) ; End condition. 
) ; End function. 