(defvar *indent-level* 0)
(defvar *indent-level-stack* (list *indent-level*))

(defclass latex-object () ())

(defclass latex-header (latex-object) ())

(defclass latex-package (latex-object)
  ((options
    :accessor pkg-options
    :initarg :options)
   (name
    :accessor pkg-name
    :initarg :pkg-name)))

(defclass tikz-picture (latex-object) ())

(defclass latex-environment (latex-object)
  (document-class
   header
   options
   body))

(defstruct (point
            (:constuctor make-point (&optional (x 0) (y 0)))
            (:predicate pointp))
  x y)

(defclass tikz-object () ())

(defclass tikz-path (tikz-object) ())

(defun -- (&rest args)
  "Straight lines between the objects given in ARGS."
  (format nil "~{~a~^ -- ~}" args))
