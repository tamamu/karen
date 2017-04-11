#|
  This file is a part of karen project.
  Copyright (c) 2017 Eddie (tamamu.1r1s@gmail.com)
|#

(in-package :cl-user)
(defpackage karen-test-asd
  (:use :cl :asdf))
(in-package :karen-test-asd)

(defsystem karen-test
  :author "Eddie"
  :license "MPL 2.0"
  :depends-on (:karen
               :prove)
  :components ((:module "tests"
                :components
                ((:test-file "karen"))))
  :description "Test system for karen"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
