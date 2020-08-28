;;;; retro-games.lisp

(in-package #:retro-games)


;definicao da classe games
(defclass game ()
	      ((name :reader name
		     :initarg :name)
	       (votes :accessor votes
		      :initform 0)))

;metodo que incrementa 1 ao numero votos
(defmethod vote-for (user-selected-game)
  (incf (votes user-selected-game)))

;criacao da lista games
(defvar *games* '())

;funcao que cria um objeto game e o adciona a lista games
(defun add-game (name)
	      (unless (game-stored? name)
		(push (make-instance 'game :name name) *games*)))

;funcao que busca um nome na lista game
(defun game-from-name (name)
	      (find name *games* :test #'string-equal
		    :key #'name))

;funcao que retorna um bool para a situacao do game (esta na lista ou nao)
(defun game-stored? (game-name)
  (game-from-name game-name))

;funcao para retornar a lsita games
(defun games ()
	      (sort (copy-list *games*) #'> :key #'votes))


;Metodo que altera como os objetos da lista serao retornados pela funcao games
(defmethod print-object((object game) stream)
	      (print-unreadable-object (object stream :type t)
		(with-slots (name votes) object
		  (format stream "name: ~s with ~d votes" name votes))))
