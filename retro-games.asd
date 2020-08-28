;;;; retro-games.asd

(asdf:defsystem #:retro-games
  :description "System used to make things easier when reading the book lisp for the web"
  :author "Joao Barboza Rodrigues <joaobarboza.ufu@gmail.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:cl-who #:hunchentoot #:parenscript)
  :components ((:file "package")
               (:file "retro-games")))
