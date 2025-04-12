DROP DATABASE IF EXISTS redesocial;
CREATE DATABASE redesocial;
USE redesocial;

CREATE TABLE usuarios (
  id INT NOT NULL,
  usuario VARCHAR(31) NOT NULL,
  senha VARCHAR(127) NOT NULL,

  PRIMARY KEY (id)
);

CREATE TABLE conversas (
  id INT NOT NULL,
  remetente INT NOT NULL,
  destinatario INT NOT NULL,
  mensagem VARCHAR(1023) NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (remetente) REFERENCES (usuarios.id),
  FOREIGN KEY (destinatario) REFERENCES (usuarios.id)
);

CREATE TABLE postagens (
  id INT NOT NULL,
  autor INT NOT NULL,
  mensagem VARCHAR(1023) NOT NULL,
  
  PRIMARY KEY (id),
  FOREIGN KEY (autor) REFERENCES (usuarios.id)
);

CREATE TABLE comentarios (
  id INT NOT NULL,
  autor INT NOT NULL,
  postagem INT NOT NULL,
  mensagem VARCHAR(1023) NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (autor) REFERENCES (usuarios.id),
  FOREIGN KEY (postagem) REFERENCES (postagens.id)
);
