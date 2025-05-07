CREATE TABLE `usuarios` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id necessario para o relacionamento entre tabelas',
	`usuario` VARCHAR(16) NOT NULL COMMENT 'nome usado no login' COLLATE 'utf8mb4_unicode_ci',
	`senha` BLOB NOT NULL COMMENT 'senha encriptada usando sha512',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `usuario` (`usuario`) USING BTREE
)
COMMENT='tabela com a conta dos usuarios'
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
AUTO_INCREMENT=7
;
CREATE TABLE `conversas` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id necessario para o relacionamento entre tabelas',
	`remetente` INT UNSIGNED NOT NULL COMMENT 'id do usuario que enviou a mensagem',
	`destinatario` INT UNSIGNED NOT NULL COMMENT 'id do usuario que recebeu a mensagem',
	`mensagem` BLOB NOT NULL COMMENT 'mensagem',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `remetente` (`remetente`) USING BTREE,
	INDEX `destinatario` (`destinatario`) USING BTREE,
	CONSTRAINT `destinatario` FOREIGN KEY (`destinatario`) REFERENCES `usuarios` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `remetente` FOREIGN KEY (`remetente`) REFERENCES `usuarios` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COMMENT='tabela das mensagem enviadas entre usuarios'
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
AUTO_INCREMENT=2
;
CREATE TABLE `postagens` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id necessario para o relacionamento entre tabelas',
	`autor` INT UNSIGNED NOT NULL COMMENT 'id do usuario que criou a postagem',
	`mensagem` BLOB NOT NULL COMMENT 'mensagem',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `autor` (`autor`) USING BTREE,
	CONSTRAINT `autor` FOREIGN KEY (`autor`) REFERENCES `usuarios` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COMMENT='tabela das postagens feitas pelos usuarios'
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
CREATE TABLE `comentarios` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id necessario para o relacionamento entre tabelas',
	`postagem` INT UNSIGNED NOT NULL COMMENT 'id da postagem a qual esse comentario pertence',
	`mensagem` BLOB NOT NULL COMMENT 'mensagem',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `postagem` (`postagem`) USING BTREE,
	CONSTRAINT `postagem` FOREIGN KEY (`postagem`) REFERENCES `postagens` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
;
