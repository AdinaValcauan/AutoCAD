 ;function that draws a box around a text 
 (defun C:TXTBOX ( / textent tb lower_left upper_right upper_left lower_right)
    
 ;gives the entity name of the selected text to textent
 (setq textent (car (entsel "Select text:")))

 ;sets the ucs to the lower left corner of the text
 (command "ucs" "Entity" textent)

 ;getting the coordinates for the vertices of the box
 (setq tb (textbox (list (cons -1 textent)))
      lower_left (car tb)
      upper_right (cadr tb)
      upper_left (list (car lower_left) (cadr upper_right))
      lower_right (list (car upper_right) (cadr lower_left))
 )
	   
 ;draws the box using the pline function 
 ;draws the polyline through the points found in the previous step
 (command "pline" lower_left lower_right upper_right upper_left lower_left "Close")

 ;reset ucs to the default position
 (command "ucs" "world")
  
 ;sends an alert message when the function is done
 (alert "Finished adding the box to the selected text")

 (princ)
)