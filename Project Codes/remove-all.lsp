(defun remove-all (arg lis)

 (cond
  ((null lis) ())
  ; If list is empty, lis is empty. 

  ( ; Case 1 starts. 
	(listp (car lis)) ; If the first element of the list is a list. 
	(cons (remove-all arg (car lis)) (remove-all arg (cdr lis)))
	; Call remove-all again, 
	; create a new list with only the first element of the original list. 
	; Call remove-all again, 
	; create a new list without the first element of the original list. 
	; Merge the two list together. 
  ) ; Case 1 ends. 

  ( ; Case 2 starts. 
    (equal (car lis) arg) ; If the first element of the list is equal to arg. 
	(remove-all arg (cdr lis))
	; Call remove-all again, 
	; create a new list without the first element. 
	; In this case, the first element is equal to the arg, 
	; so all elements that are equal to arg will go through case 2, 
	; thus, these elements are deleted one by one until the program ends. 
  ) ; Case 2 ends. 
  
  (t (cons (car lis) (remove-all arg (cdr lis))))
  ; Case 3, or default case, where the first element of the list is neither in case 1 or case 2. 

 ) ; End condition. 
) ; End function. 