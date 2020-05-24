;;; I also want to support feynman and chemfig since they are based on TikZ.

;;; It's cool, because writing such a DSL is mostly just putting strings together.
;;; Since we have the powerful FORMAT DSL plus CLOS and everything of CL (even macro capability!),
;;; also complex tasks become quite easy doable.

;;; CLOS offers not just normal methods with meta- and multiple inheritance, but also
;;; some stuff named :BEFORE and :AFTER methods.
;;; They substitute the primary methods and keep them clean and transparent.

;;; I learned (after YEARS and playing with PSTricks) about TikZ and how to use it
;;; from a video course of Edi Weitz at HAW. Thanks!

(defvar *indent-level* 0
  "The level of line indentation.
   Take it double and you have the spaces preceding the content.")

(defvar *indent-level-stack* (list *indent-level*)
  "To remember which indentation levels were used.
   Push and pop them since this variable is a CONS.")

(defclass latex-object ()
  "Our most basic type of LaTeX-objects."
  ())

(defclass latex-header (latex-object)
  "The type for the set of all stuff, that can go into a LaTeX-header."
  ())

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
  "A classic point struct.
   As long we don't need CLOS for it, structs are better."
  x y)

(defclass tikz-object ()
  "The most basic type for TikZ objects."
  ())

(defclass tikz-picture (tikz-object)
  "The parent type for all kinds of TikZ pictures."
  ())

(defclass tikz-path (tikz-object)
  "The basic type for TikZ paths."
  ())

(defun -- (&rest args)
  "Straight lines between the objects given in ARGS."
  (format nil "~{~a~^ -- ~}" args))

(defun matrix-table ((rows cols) contents)
  "Takes from us the tedious work of handling matrix tables.")
