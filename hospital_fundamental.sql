CREATE DATABASE IF NOT EXISTS `hospital_fundamental`;

USE `hospital_fundamental`;

CREATE TABLE IF NOT EXISTS `paciente` (
  `id_paciente` int PRIMARY KEY AUTO_INCREMENT,
  `nome_completo` varchar(255),
  `data_nascimento` date,
  `endereco_fk` int,
  `telefone` varchar(255),
  `email` varchar(255),
  `rg` varchar(255),
  `cpf` varchar(255),
  `convenio_fk` int
);

CREATE TABLE IF NOT EXISTS `convenio` (
  `id_convenio` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255),
  `cnpj` varchar(255),
  `tempo_carencia` int
);

CREATE TABLE IF NOT EXISTS `medico` (
  `id_medico` int PRIMARY KEY AUTO_INCREMENT,
  `nome_completo` varchar(255),
  `endereco_fk` int,
  `telefone` varchar(255),
  `cpf` varchar(255),
  `rg` varchar(255),
  `cargo_fk` int,
  `especialidade_fk` int
);

CREATE TABLE IF NOT EXISTS `cargo` (
  `id_cargo` int PRIMARY KEY AUTO_INCREMENT,
  `nome_cargo` varchar(255)
);

CREATE TABLE IF NOT EXISTS `especialidade` (
  `id_especialidade` int PRIMARY KEY AUTO_INCREMENT,
  `nome_especialidade` varchar(255)
);

CREATE TABLE IF NOT EXISTS `consulta` (
  `id_consulta` int PRIMARY KEY AUTO_INCREMENT,
  `data` date,
  `hora` time,
  `medico_fk` int,
  `paciente_fk` int,
  `valor_consulta` int,
  `nome_convenio` int,
  `especialidade` int,
  `receita_fk` int
);

CREATE TABLE IF NOT EXISTS `receita` (
  `id_receita` int PRIMARY KEY AUTO_INCREMENT,
  `paciente` int,
  `medico` int,
  `medicamentos` varchar(255),
  `quatidade` varchar(255),
  `instrucoes` varchar(255)
);

CREATE TABLE IF NOT EXISTS `endereco` (
  `id_endereco` int PRIMARY KEY AUTO_INCREMENT,
  `rua` varchar(255),
  `numero` varchar(255),
  `cep` varchar(255)
);

CREATE TABLE IF NOT EXISTS `enfermeiro` (
  `id_enfermeiro` int PRIMARY KEY AUTO_INCREMENT,
  `nome_completo` varchar(255),
  `cpf` varchar(255),
  `cre` varchar(255)
);

CREATE TABLE IF NOT EXISTS `internacao` (
  `id_internacao` int PRIMARY KEY AUTO_INCREMENT,
  `quarto_fk` int,
  `paciente_fk` int,
  `medico_fk` int,
  `enfermeiro_fk` int,
  `data_entrada` date,
  `data_prev_saida` date,
  `data_alta` date,
  `procedimento` varchar(255)
);

CREATE TABLE IF NOT EXISTS `quarto` (
  `id_quarto` int PRIMARY KEY AUTO_INCREMENT,
  `numero` int,
  `tipo_fk` int
);

CREATE TABLE IF NOT EXISTS `tipo_quarto` (
  `id_tipo` int PRIMARY KEY AUTO_INCREMENT,
  `descricao` varchar(255),
  `valor_diaria` int
);

ALTER TABLE `paciente` ADD FOREIGN KEY (`endereco_fk`) REFERENCES `endereco` (`id_endereco`);

ALTER TABLE `paciente` ADD FOREIGN KEY (`convenio_fk`) REFERENCES `convenio` (`id_convenio`);

ALTER TABLE `medico` ADD FOREIGN KEY (`endereco_fk`) REFERENCES `endereco` (`id_endereco`);

ALTER TABLE `medico` ADD FOREIGN KEY (`cargo_fk`) REFERENCES `cargo` (`id_cargo`);

ALTER TABLE `medico` ADD FOREIGN KEY (`especialidade_fk`) REFERENCES `especialidade` (`id_especialidade`);

ALTER TABLE `consulta` ADD FOREIGN KEY (`medico_fk`) REFERENCES `medico` (`id_medico`);

ALTER TABLE `consulta` ADD FOREIGN KEY (`paciente_fk`) REFERENCES `paciente` (`id_paciente`);

ALTER TABLE `consulta` ADD FOREIGN KEY (`receita_fk`) REFERENCES `receita` (`id_receita`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`quarto_fk`) REFERENCES `quarto` (`id_quarto`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`paciente_fk`) REFERENCES `paciente` (`id_paciente`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`medico_fk`) REFERENCES `medico` (`id_medico`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`enfermeiro_fk`) REFERENCES `enfermeiro` (`id_enfermeiro`);

ALTER TABLE `quarto` ADD FOREIGN KEY (`tipo_fk`) REFERENCES `tipo_quarto` (`id_tipo`);

-- PARTE 3
-- add especialidades
insert into especialidade (id_especialidade, nome_especialidade) values (null, 'Pediatria');
insert into especialidade (id_especialidade, nome_especialidade) values (null, 'Clínica Geral');
insert into especialidade (id_especialidade, nome_especialidade) values (null, 'Gastroenterologia');
insert into especialidade (id_especialidade, nome_especialidade) values (null, 'Dermatologia');
insert into especialidade (id_especialidade, nome_especialidade) values (null, 'Cardiologista');
insert into especialidade (id_especialidade, nome_especialidade) values (null, 'Radiologista');
insert into especialidade (id_especialidade, nome_especialidade) values (null, 'Geriatria');

-- add cargos
insert into cargo(id_cargo, nome_cargo) values (null, 'Generalista');
insert into cargo(id_cargo, nome_cargo) values (null, 'Especialista');
insert into cargo(id_cargo, nome_cargo) values (null, 'Residente');

-- add tipo de quarto
insert into tipo_quarto(id_tipo,descricao,valor_diaria) values (null, 'Quarto duplo', 4000.00);
insert into tipo_quarto(id_tipo,descricao,valor_diaria) values (null, 'Apartamento', 6000.00);
insert into tipo_quarto(id_tipo,descricao,valor_diaria) values (null, 'Enfermaria', 2000.00);

alter table convenio modify column tempo_carencia varchar(255);

-- add convenio
insert into convenio(id_convenio, nome, cnpj, tempo_carencia) 
values (null, 'Ambulatorial', '23.400.768/0001-43', '24 horas');
insert into convenio(id_convenio, nome, cnpj, tempo_carencia) 
values (null, 'Hospitalar sem cobertura obstétrica', '23.400.768/0001-43', '24 horas');
insert into convenio(id_convenio, nome, cnpj, tempo_carencia) 
values (null, 'Hospitalar com obstetrícia', '23.400.768/0001-43', ' 180 dias (6 meses)');
insert into convenio(id_convenio, nome, cnpj, tempo_carencia) 
values (null, 'Exclusivo odontológico', '23.400.768/0001-43', '300 dias (10 meses)');

-- add medicos e enderecos
insert into endereco(id_endereco, rua, numero, cep) values (null, 'Rua dos Palmares', '45', '09032-090');
insert into medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) values (null, 'Eduardo Alves da Silva', 1, '(11)99678-9999', '337.787.888-00', '30.456.432-3', 2, 1);

insert into endereco(id_endereco, rua, numero, cep) values (null, 'Avenida Romana II', '4390', '29383-070');
insert into medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) values (null, 'Rosemeire Domingues Rosa', 2, '(11)97368-3899', '782.902.485-41', '85.478.445-7', 2, 1);

insert into endereco(id_endereco, rua, numero, cep) values (null, 'Rua Custodio de Mendonça', '685', '29332-090');
insert into medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) values (null, 'Moasir Júnior Vieira', 3, '(11)94445-7484', '445.455.455-85', '54.745.478-5', 1, 2);

insert into endereco(id_endereco, rua, numero, cep) values (null, 'Rua Ralados', '45', '03784-090');
insert into medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) values (null, 'Rodrigo Ferreira', 4, '(11)97885-7484', '632.454.784-85', '54.745.478-5', 2, 3);

insert into endereco(id_endereco, rua, numero, cep) values (null, 'Avenida Antartica', '293', '09032-090');
insert into medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) values (null, 'Maria Lúcia dos Anjos', 5, '(11)94515-7484', '582.455.455-85', '54.855.233-5', 2, 4);

insert into endereco(id_endereco, rua, numero, cep) values (null, "Rua Le'Charple", '94', '0837-090');
insert into medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) values (null, 'Victor Martins de Sousa', 6, '(11)95865-7455', '458.455.455-85', '54.744.855-5', 2, 5);

insert into endereco(id_endereco, rua, numero, cep) values (null, 'Avenida Romúlo', '9303', '03822-090');
insert into medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) values (null, 'Rubens Silva Lima', 7, '(11)95865-7455', '844.451.965-85', '54.566.855-5', 2, 6);

insert into endereco(id_endereco, rua, numero, cep) values (null, 'Rua Guaiçara', '3232', '03838-090');
insert into medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) values (null, 'Roberta Avelar', 8, '(11)95865-7455', '566.899.321-85', '54.744.633-5', 2, 7);

insert into endereco(id_endereco, rua, numero, cep) values (null, 'Avenida de Dom Pedro III', '839', '03883-090');
insert into medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) values (null, 'Urubatan Sampaio', 9, '(11)95865-7455', '845.855.845-85', '54.744.230-5', 3, 1);

insert into endereco(id_endereco, rua, numero, cep) values (null, 'Rua dos Palmares', '45', '02933-090');
insert into medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) values (null, 'Alfonso Queróis', 10, '(11)95865-7455', '896.562.485-85', '54.480.855-5', 3, 5);

