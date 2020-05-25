(defun count-all (lis)

 (cond
  ((null lis) 0)
  ; If list is empty, lis is 0. 
 
  ( ; Start of Case 1.  
   (symbolp (car lis)) ; Case 1, if first element of lis is a symbol. 
   (+ 1 (count-all (cdr lis)))
   ; Starts from 1, increment by 1 each time. 
   ; Calls count-all again, 
   ; but pass back in a list without first element. 
   ; For each recursive call that meets case 1 criteria, 
   ; a symbol is remove from the list, and the counter is increment by 1 each time.  
  ) ; End of Case 1. 

  ( ; Start of Case 2.  
   (numberp (car lis)) ; Case 2, if first element of lis is a number. 
   (+ 0 (count-all (cdr lis)))
   ; Add zero whenever it reads the first element as number. 
   ; Calls count-all again, 
   ; but pass back in a list without first element. 
   ; Thus, it nullifies the number that will be added later on. 
  ) ; End of Case 2. 

  ( ; Start of Case 3.  
   (listp (car lis)) ; Case 3, if first element of lis is a list. 
   (+ 1 (count-all (cdr lis)))
   ; Calls count-all again, 
   ; but pass back in a list with only the first element, a sublist. 
   ; Add first element (sublist) of lis to rest of lis. 
   ; Calls count-all again, 
   ; but pass back in a list without first element.  
  ) ; End of Case 3. 

  (t (eval (cons '+ lis)))
  ; Case 4, or default case.  This is where first element isn't a symbol, number, or a list. 

 ) ; End condition. 
) ; End function. 