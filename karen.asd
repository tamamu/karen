#|
  This file is a part of karen project.
  Copyright (c) 2017 Eddie (tamamu.1r1s@gmail.com)
|#

#|
  Author: Eddie (tamamu.1r1s@gmail.com)
|#

(in-package :cl-user)
(defpackage karen-asd
  (:use :cl :asdf))
(in-package :karen-asd)

(defsystem karen
  :version "0.1"
  :author "Eddie"
  :license "MPL 2.0"
  :depends-on (:cl-annot
               :cl-opengl
               :cl-glut
               :alexandria
               :uiop
               :lparallel
               :trivial-features)
  :components ((:module "src"
                :components
                ((:file "karen"))))
  :description "Experimental web browser engine implemented in Common Lisp"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op karen-test))))
