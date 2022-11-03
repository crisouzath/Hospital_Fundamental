CREATE DATABASE hospital_fundamental;
use hospital_fundamental;

CREATE TABLE `paciente` (
  `id_paciente` int PRIMARY KEY AUTO_INCREMENT,
  `nome_completo` varchar(255),
  `data_nascimento` date,
  `endereco` varchar(255),
  `telefone` varchar(255),
  `email` varchar(255),
  `rg` varchar(255),
  `cpf` varchar(255),
  `convenio` int
);

CREATE TABLE `convenio` (
  `id_convenio` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255),
  `cnpj` varchar(255),
  `tempo_carencia` int
);

CREATE TABLE `medico` (
  `id_medico` int PRIMARY KEY AUTO_INCREMENT,
  `nome_completo` varchar(255),
  `endereco` varchar(255),
  `telefone` varchar(255),
  `cpf` varchar(255),
  `rg` varchar(255),
  `cargo` int,
  `especialidade` int
);

CREATE TABLE `cargo` (
  `id_cargo` int PRIMARY KEY AUTO_INCREMENT,
  `nome_cargo` varchar(255)
);

CREATE TABLE `especialidade` (
  `id_especialidade` int PRIMARY KEY AUTO_INCREMENT,
  `nome_especialidade` varchar(255)
);

CREATE TABLE `consulta` (
  `id_consulta` int PRIMARY KEY AUTO_INCREMENT,
  `data` date,
  `hora` time,
  `medico` int,
  `paciente` int,
  `valor_consulta` int,
  `nome_convenio` int,
  `especialidade` int,
  `receita` int
);

CREATE TABLE `receita` (
  `id_receita` int PRIMARY KEY AUTO_INCREMENT,
  `paciente` int,
  `medico` int,
  `medicamentos` varchar(255),
  `quatidade` varchar(255),
  `instrucoes` varchar(255)
);

CREATE TABLE `enfermeiro` (
  `id_enfermeiro` int PRIMARY KEY AUTO_INCREMENT,
  `nome_completo` varchar(255),
  `cpf` varchar(255),
  `cre` varchar(255)
);

CREATE TABLE `internacao` (
  `id_internacao` int PRIMARY KEY AUTO_INCREMENT,
  `quarto` int,
  `paciente` int,
  `medico` int,
  `emfermeiro` int,
  `data_entrada` date,
  `data_prev_saida` date,
  `data_alta` date,
  `procedimento` varchar(255)
);

CREATE TABLE `quarto` (
  `id_quarto` int PRIMARY KEY AUTO_INCREMENT,
  `numero` int,
  `tipo` int
);

CREATE TABLE `tipo_quarto` (
  `id_tipo` int PRIMARY KEY AUTO_INCREMENT,
  `descricao` varchar(255),
  `valor_diaria` int
);

ALTER TABLE `paciente` ADD FOREIGN KEY (`convenio`) REFERENCES `convenio` (`id_convenio`);

ALTER TABLE `medico` ADD FOREIGN KEY (`cargo`) REFERENCES `cargo` (`id_cargo`);

ALTER TABLE `medico` ADD FOREIGN KEY (`especialidade`) REFERENCES `especialidade` (`id_especialidade`);

ALTER TABLE `consulta` ADD FOREIGN KEY (`medico`) REFERENCES `medico` (`id_medico`);

ALTER TABLE `consulta` ADD FOREIGN KEY (`paciente`) REFERENCES `paciente` (`id_paciente`);

ALTER TABLE `consulta` ADD FOREIGN KEY (`receita`) REFERENCES `receita` (`id_receita`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`quarto`) REFERENCES `quarto` (`id_quarto`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`paciente`) REFERENCES `paciente` (`id_paciente`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`medico`) REFERENCES `medico` (`id_medico`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`emfermeiro`) REFERENCES `enfermeiro` (`id_enfermeiro`);

ALTER TABLE `quarto` ADD FOREIGN KEY (`tipo`) REFERENCES `tipo_quarto` (`id_tipo`);

insert into especialidade (id_especialidade, nome_especialidade) values (null, 'Pediatria');
insert into especialidade (id_especialidade, nome_especialidade) values (null, 'Clínica Geral');
insert into especialidade (id_especialidade, nome_especialidade) values (null, 'Gastroenterologia');
insert into especialidade (id_especialidade, nome_especialidade) values (null, 'Dermatologia');

insert into tipo_quarto(id_tipo,descricao,valor_diaria) values (null, 'Quarto duplo', 4000.00);
insert into tipo_quarto(id_tipo,descricao,valor_diaria) values (null, 'Apartamento', 6000.00);
insert into tipo_quarto(id_tipo,descricao,valor_diaria) values (null, 'Enfermaria', 2000.00);

insert into cargo(id_cargo, nome_cargo) values (null, 'Generalista');
insert into cargo(id_cargo, nome_cargo) values (null, 'Especialista');
insert into cargo(id_cargo, nome_cargo) values (null, 'Residente');

insert into medico(id_medico, nome_completo, endereco, telefone, cpf, rg, cargo, especialidade ) values (null, 'Eduardi Alves', '', '(11)99999-9999', '1234567891-1', '5555555555', 2, 1);

