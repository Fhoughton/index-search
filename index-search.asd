(defsystem "index-search"
  :author "Fhoughton"
  :license "LGPL-3.0"
  :description "A multithreaded list search that provides power and speed."
  :version "1.0.0"

  ;; Dependencies
  :depends-on ("split-sequence"
               "lparallel"
               )

  ;; Project files / load order
  :components ((:module "src"
                :components ((:file "package")
                             (:file "stuff" :depends-on ("package"))
                             )))