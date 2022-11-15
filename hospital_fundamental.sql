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
  `tempo_carencia` varchar(255)
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
  `convenio_fk` int,
  `especialidade` int,
  `receita_fk` int
);

CREATE TABLE IF NOT EXISTS `receita` (
  `id_receita` int PRIMARY KEY AUTO_INCREMENT,
  `paciente_fk` int,
  `medico_fk` int,
  `medicamentos` varchar(255),
  `quantidade` varchar(255),
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
  `enfermeiro_auxiliar_fk` int,
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

ALTER TABLE `consulta` ADD FOREIGN KEY (`convenio_fk`) REFERENCES `convenio` (`id_convenio`);

ALTER TABLE `consulta` ADD FOREIGN KEY (`paciente_fk`) REFERENCES `paciente` (`id_paciente`);

ALTER TABLE `consulta` ADD FOREIGN KEY (`receita_fk`) REFERENCES `receita` (`id_receita`);

ALTER TABLE `receita` ADD FOREIGN KEY (`paciente_fk`) REFERENCES `paciente` (`id_paciente`);

ALTER TABLE `receita` ADD FOREIGN KEY (`medico_fk`) REFERENCES `medico` (`id_medico`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`quarto_fk`) REFERENCES `quarto` (`id_quarto`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`paciente_fk`) REFERENCES `paciente` (`id_paciente`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`medico_fk`) REFERENCES `medico` (`id_medico`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`enfermeiro_fk`) REFERENCES `enfermeiro` (`id_enfermeiro`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`enfermeiro_auxiliar_fk`) REFERENCES `enfermeiro` (`id_enfermeiro`);

ALTER TABLE `quarto` ADD FOREIGN KEY (`tipo_fk`) REFERENCES `tipo_quarto` (`id_tipo`);

-- PARTE 3
-- adicionando especialidades
INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (null, 'Pediatria');

INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (null, 'Clínica Geral');

INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (null, 'Gastroenterologia');

INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (null, 'Dermatologia');

INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (null, 'Cardiologista');

INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (null, 'Radiologista');

INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (null, 'Geriatria');

-- adicionando cargos
INSERT INTO cargo(id_cargo, nome_cargo) 
VALUES (null, 'Generalista');

INSERT INTO cargo(id_cargo, nome_cargo) 
VALUES (null, 'Especialista');

INSERT INTO cargo(id_cargo, nome_cargo) 
VALUES (null, 'Residente');

-- adicionando tipo de quarto
insert into tipo_quarto(id_tipo,descricao,valor_diaria) values (null, 'Quarto duplo', 4000.00);
insert into tipo_quarto(id_tipo,descricao,valor_diaria) values (null, 'Apartamento', 6000.00);
insert into tipo_quarto(id_tipo,descricao,valor_diaria) values (null, 'Enfermaria', 2000.00);

-- adicionando quartos
insert into quarto(id_quarto, numero, tipo_fk) values (null, 100, 1);
insert into quarto(id_quarto, numero, tipo_fk) values (null, 230, 1);
insert into quarto(id_quarto, numero, tipo_fk) values (null, 456, 1);
insert into quarto(id_quarto, numero, tipo_fk) values (null, 200, 2);
insert into quarto(id_quarto, numero, tipo_fk) values (null, 201, 2);
insert into quarto(id_quarto, numero, tipo_fk) values (null, 202, 2);
insert into quarto(id_quarto, numero, tipo_fk) values (null, 930, 3);

-- adicionando enfermeiros
insert into enfermeiro(id_enfermeiro, nome_completo, cpf, cre) values(null, 'Stephanie Sousa', '74851574', '415879');
insert into enfermeiro(id_enfermeiro, nome_completo, cpf, cre) values(null, 'Josué Armandes', '58749617', '254109');
insert into enfermeiro(id_enfermeiro, nome_completo, cpf, cre) values(null, 'Angelo Domingues', '78032145', '012478');
insert into enfermeiro(id_enfermeiro, nome_completo, cpf, cre) values(null, 'Bruna de Araujo', '10479547', '960124');
insert into enfermeiro(id_enfermeiro, nome_completo, cpf, cre) values(null, 'Angelo Domingues', '87459612', '784169');
insert into enfermeiro(id_enfermeiro, nome_completo, cpf, cre) values(null, 'Joaquim Afonso de Sousa', '20147896', '894175');
insert into enfermeiro(id_enfermeiro, nome_completo, cpf, cre) values(null, 'Priscila de Almeida', '12047953', '784196');
insert into enfermeiro(id_enfermeiro, nome_completo, cpf, cre) values(null, 'Douglas Silva', '2143608', '254987');
insert into enfermeiro(id_enfermeiro, nome_completo, cpf, cre) values(null, 'Pedro Augusto', '74198569', '120478');
insert into enfermeiro(id_enfermeiro, nome_completo, cpf, cre) values(null, 'Angelina do Anjos', '88742514', '251369');

-- adicionando convenio
insert into convenio(id_convenio, nome, cnpj, tempo_carencia) 
values (null, 'AMIvida', '23.400.768/0001-43', '24 horas');
insert into convenio(id_convenio, nome, cnpj, tempo_carencia) 
values (null, 'Comandre', '23.938.748/0001-43', '24 horas');
insert into convenio(id_convenio, nome, cnpj, tempo_carencia) 
values (null, 'Saúde+', '23.400.308/0001-43', ' 180 dias (6 meses)');
insert into convenio(id_convenio, nome, cnpj, tempo_carencia) 
values (null, 'Camilla', '23.400.768/3941-43', '300 dias (10 meses)');

-- adicionando 10 medicos e enderecos
INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua dos Palmares', '45', '09032-090');
INSERT INTO medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) 
VALUES (null, 'Eduardo Alves da Silva', 1, '(11)99678-9999', '337.787.888-00', '30.456.432-3', 2, 1);

INSERT INTo endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Avenida Romana II', '4390', '29383-070');
INSERT INTO medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) 
VALUES (null, 'Rosemeire Domingues Rosa', 2, '(11)97368-3899', '782.902.485-41', '85.478.445-7', 2, 1);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Custodio de Mendonça', '685', '29332-090');
INSERT INTO medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) 
VALUES (null, 'Moasir Júnior Vieira', 3, '(11)94445-7484', '445.455.455-85', '54.745.478-5', 1, 2);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Ralados', '45', '03784-090');
INSERT INTO medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) 
VALUES (null, 'Rodrigo Ferreira', 4, '(11)97885-7484', '632.454.784-85', '54.745.478-5', 2, 3);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Avenida Antartica', '293', '09032-090');
INSERT INTO medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) 
VALUES (null, 'Maria Lúcia dos Anjos', 5, '(11)94515-7484', '582.455.455-85', '54.855.233-5', 2, 4);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, "Rua Le'Charple", '94', '0837-090');
INSERT INTO medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) 
VALUES (null, 'Victor Martins de Sousa', 6, '(11)95865-7455', '458.455.455-85', '54.744.855-5', 2, 5);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Avenida Romúlo', '9303', '03822-090');
INSERT INTO medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) 
VALUES (null, 'Rubens Silva Lima', 7, '(11)95865-7455', '844.451.965-85', '54.566.855-5', 2, 6);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Guaiçara', '3232', '03838-090');
INSERT INTO medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) 
VALUES (null, 'Roberta Avelar', 8, '(11)95865-7455', '566.899.321-85', '54.744.633-5', 2, 7);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Avenida de Dom Pedro III', '839', '03883-090');
INSERT INTO medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) 
VALUES (null, 'Urubatan Sampaio', 9, '(11)95865-7455', '845.855.845-85', '54.744.230-5', 3, 1);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua dos Palmares', '45', '02933-090');
INSERT INTO medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) 
VALUES (null, 'Alfonso Queróis', 10, '(11)95865-7455', '896.562.485-85', '54.480.855-5', 3, 5);

-- adicionando 15 pacientes
INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Getúlio Vargas', '267', '85818-680');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Ruan Mota', '2001-02-19', 11,'ruan.mota@gmail.com', '(11)98597-4585', '245.505.673-25', '38.571.245-5', null);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Murilo Braga', '423', '64019-750');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Mariane Tatiane Rodrigues', '1946-01-10', 12,'mariane.tatiane.rodrigues@gmail.com', '(11)98352-7963', '082.160.165-22', '41.013.285-8', 2);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Dom Alberto Gonçalves', '781', '80510-340');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Enrico Anthony das Neves', '1961-07-25', 13,'enrico-dasneves73@gmail.com', '(11)98587-6027', '860.379.730-75', '41.288.783-6', 2);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, '3ª Travessa Alvorada', '338', '54756-782');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Olivia Helena Freitas', '1959-04-14', 14,'olivia_helena_freitas@gmail.com', '(11)98480-6514', '632.415.331-23', '14.069.408-0', 2);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Guarani', '822', '29162-138');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Carlos Vitor Gustavo Sales', '1991-11-01', 15,'carlos_vitor_sales@gmail.com', '(11)99709-8499', '967.741.603-01', '10.679.682-3', 4);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Princesa Kristiane', '133', '79076-252');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Caio Rafael Manuel Moreira', '1959-09-19', 16,'caio.rafael.moreira@gmail.com', '(11)98370-1624', '003.050.896-76', '26.050.036-7', 2);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua São Gonçalo do Amarante', '798', '59104-030');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Regina Luana Bernardes', '1994-03-13', 17,'regina_bernardes@gmail.com', '(11)98416-1881', '485.039.448-55', '10.418.200-3', null);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua F8', '806', '77426-056');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Heloisa Emilly Castro', '1960-05-12', 18, 'heloisa_emilly_castro@gmail.com', '(11)99236-2175', '279.260.450-63', '12.532.162-4', 2);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua São Tiago', '370', '61602-340');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Aline Elaine Emanuelly Drumond', '2002-02-10', 18,'aline-drumond96@gmail.com', '(11)98255-5115', '722.426.469-58', '28.373.181-3', null);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Avenida André Antônio Maggi', '578', '78556-336');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Larissa Alana Moraes', '1995-06-20', 19,'larissa.alana.moraes@gmail.com', '(11)98173-3945', '478.926.460-27', '46.566.077-0', 3);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Cândida Raimunda de Jesus', '928', '59600-328');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Raimundo Matheus Souza', '1982-11-01', 20,'raimundo-souza70@gmail.com', '(11)99983-2201', '032.861.901-95', '43.688.624-8', 3);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Jacinto Basseti', '865', '29703-615');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Marcelo Samuel Almada', '1947-04-23', 21,'marcelo_samuel_almada@gmail.com', '(11)98736-7690', '656.214.480-90', '43.430.564-9', 4);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Quadra 1203 Sul Alameda 27', '', '77019-434');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Joana Aline Bárbara Mendes', '1963-04-017',20,'joanaalinemendes@gmail.com', '(11)98745-1536', '735.499.526-60', '36.760.716-5', 2);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Vargas', '1921', '82902-832');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Judas Raimundo da Silva', '2001-12-19', 11,'judas@gmail.com', '(11)98597-3892', '245.325.393-25', '38.283.245-5', 3);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Getúlio', '22', '29929-680');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Rosana Martin Queirois', '2001-09-12', 11,'rosa.martins@gmail.com', '(11)92832-4585', '245.505.673-25', '38.571.245-5', 2);

-- adicionando 20 consultas e receitas

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 4,8, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '2015-02-28', '12:00:00', 8, 4, 1200.00, 2, 7, 1);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 4,8, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 24 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '2015-03-30', '15:45:00', 8, 4, 1300.00, 1, 7, 2);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 1,8, "Dipirona", "1 comprimida","1 comprimido a cada dois dias no periodo de uma semana");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '2015-06-30', '10:00:00', 8, 1, 1000.00, null, 1, 3);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 3,6, "Romaselina", "10g", "Cobrir as feridas com a pomada Rosamelina uma vez ao dia");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '2016-03-26', '18:40:00', 6, 3, 1200.00, 2, 4, 4);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 4,6, "Poliramos", "1 comprimido", "Tomar um comprimido a cada doze horas no periodo de um dia");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '2016-10-14', '09:00:00', 6, 4, 1200.00, 2, 5, 5);

INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '2016-10-04', '12:00:00', 7, 5, 1200.00, 4, 6, null);

INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '2017-02-28', '12:00:00', 6, 7, 120.00, null, 6, null);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 9,2, "Dipirona", "1 comprimida","1 comprimido a cada dois dias no periodo de uma semana");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '2017-02-28', '12:00:00', 2, 9, 150.00, null, 1, 6);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 2,8, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '2017-02-28', '12:00:00', 8, 2, 1200.00, 1, 7, 7);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 5,4, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '2018-02-28', '12:00:00', 4, 5, 100.00, 3, 3, 8);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 11,7, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '2018-02-28', '12:00:00', 7, 11, 100.00, 3, 6, 9);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 11,7, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '2018-07-28', '12:00:00', 7, 11, 100.00, 3, 6, 10);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 12,8, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '2019-02-28', '12:00:00', 8, 12, 100.00, 2, 7, 11);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 14,3, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '2019-02-28', '12:00:00', 3, 14, 190.00, 3, 2, 12);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 15,3, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '2019-02-28', '12:00:00', 3, 15, 100.00, 2, 2, 13);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 9,2, "Dipirona", "1 comprimida","1 comprimido a cada dois dias no periodo de uma semana");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '2020-02-28', '12:00:00', 2, 9, 150.00, null, 1, 14);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 2,8, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '2020-02-28', '12:00:00', 8, 2, 1200.00, 1, 7, 15);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 5,4, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '2020-02-28', '12:00:00', 4, 5, 100.00, 3, 3, 16);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 11,7, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '2021-02-28', '12:00:00', 7, 11, 100.00, 3, 6, 17);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 11,7, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '2021-07-28', '12:00:00', 7, 11, 100.00, 3, 6, 18);

-- adicionando internações
INSERT INTO internacao(id_internacao, quarto_fk, paciente_fk, medico_fk, enfermeiro_fk, enfermeiro_auxiliar_fk, data_entrada, data_prev_saida, data_alta, procedimento)
VALUES(null, 1, 12, 6, 1, 2, '2015-12-08', '2016-01-04', '2016-01-10', "Trocar as bombas de redenção de liquido");

INSERT INTO internacao(id_internacao, quarto_fk, paciente_fk, medico_fk, enfermeiro_fk, enfermeiro_auxiliar_fk, data_entrada, data_prev_saida, data_alta, procedimento)
VALUES(null, 1, 11, 6, 1, 2, '2016-01-10', '2016-01-20', '2016-03-10', "Trocar as bombas de redenção de liquido");

INSERT INTO internacao(id_internacao, quarto_fk, paciente_fk, medico_fk, enfermeiro_fk, enfermeiro_auxiliar_fk, data_entrada, data_prev_saida, data_alta, procedimento)
VALUES(null, 2, 1, 1, 3, 4, '2016-01-10', '2016-01-20', '2016-03-10', "Injetar soro a cada doze horas");

INSERT INTO internacao(id_internacao, quarto_fk, paciente_fk, medico_fk, enfermeiro_fk, enfermeiro_auxiliar_fk, data_entrada, data_prev_saida, data_alta, procedimento)
VALUES(null, 3, 12, 6, 5, 6, '2017-01-10', '2017-01-20', '2017-03-10', "Trocar as bombas de redenção de liquido");

INSERT INTO internacao(id_internacao, quarto_fk, paciente_fk, medico_fk, enfermeiro_fk, enfermeiro_auxiliar_fk, data_entrada, data_prev_saida, data_alta, procedimento)
VALUES(null, 6, 8, 3, 7, 8, '2019-07-10', '2019-08-20', '2019-08-10', "Trocar as bombas de redenção de liquido");

INSERT INTO internacao(id_internacao, quarto_fk, paciente_fk, medico_fk, enfermeiro_fk, enfermeiro_auxiliar_fk, data_entrada, data_prev_saida, data_alta, procedimento)
VALUES(null, 6, 8, 3, 9, 2, '2020-01-10', '2020-01-20', '2021-03-10', "Paciente em observação");

INSERT INTO internacao(id_internacao, quarto_fk, paciente_fk, medico_fk, enfermeiro_fk, enfermeiro_auxiliar_fk, data_entrada, data_prev_saida, data_alta, procedimento)
VALUES(null, 7, 10, 10, 10, 5, '2021-01-10', '2021-01-20', '2021-03-10', "Dar os comprimidos indicados e observar as reações do paciente");

-- parte 4
-- adicionar coluna em_atividade
ALTER TABLE medico ADD em_atividade varchar(255);

-- alterar a tabela medico
update medico set em_atividade = case id_medico
when 1 then 'Ativo'
when 2 then 'Ativo'
when 3 then 'Inativo'
when 4 then 'Ativo'
when 5 then 'Ativo'
when 6 then 'Ativo'
when 7 then 'Inativo'
when 8 then 'Ativo'
when 9 then 'Ativo'
when 10 then 'Ativo'
end
where id_medico in (1,2,3,4,5,6,7,8,9,10)

-- PARTE 5
-- Todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas sob convênio.
select * from consulta having year(data) = '2020';

-- Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta.
select * from internacao where data_alta > data_prev_saida;

-- Receituário completo da primeira consulta registrada com receituário associado.
select receita.medicamentos, receita.quantidade, receita.instrucoes, paciente.nome_completo as paciente_nome, medico.nome_completo as medico_paciente  from receita inner join paciente on receita.paciente_fk=paciente.id_paciente inner join medico on receita.medico_fk=medico.id_medico order by receita.id_receita limit 1;

-- Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio).
select *, Max(valor_consulta), Min(valor_consulta) from consulta group by convenio_fk is null;

-- Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta.
 select internacao.id_internacao, quarto.id_quarto, datediff(data_alta, data_entrada) AS dias_em_uso, tipo_quarto.valor_diaria, datediff(data_alta, data_entrada) * tipo_quarto.valor_diaria valor_total from internacao inner join quarto on internacao.quarto_fk = quarto.id_quarto inner join tipo_quarto on quarto.tipo_fk = tipo_quarto.id_tipo group by id_internacao;
 
 -- Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.
 Select internacao.data_entrada, internacao.procedimento, quarto.numero from internacao inner join quarto on quarto.id_quarto = internacao.quarto_fk where quarto.tipo_fk = 2;
 
 -- Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta.
  select paciente.nome_completo, consulta.data, especialidade.nome_especialidade from consulta inner join paciente on paciente.id_paciente = consulta.paciente_fk inner join especialidade on especialidade.id_especialidade = consulta.especialidade where consulta.especialidade <> 1 and YEAR(consulta.data) - YEAR(paciente.data_nascimento) < 19 and YEAR(consulta.data) - YEAR(paciente.data_nascimento) > 0 order by consulta.data;
  
  -- Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.
  select paciente.nome_completo, medico.nome_completo, internacao.data_entrada, internacao.procedimento, quarto.tipo_fk from internacao inner join medico on medico.id_medico = internacao.medico_fk inner join paciente on paciente.id_paciente = internacao.paciente_fk inner join quarto on quarto.id_quarto = internacao.quarto_fk where quarto.tipo_fk = 3 and medico.especialidade_fk = 3;
  
-- Os nomes dos médicos e a quantidade de consultas que cada um realizou.
SELECT medico.nome_completo, COUNT(consulta.medico_fk) AS 'Quantidade de consultas' 
FROM medico
INNER JOIN consulta 
ON medico.id_medico = consulta.medico_fk
GROUP BY consulta.medico_fk;

-- Todos os médicos que tenham "Gabriel" no nome.
select * from medico where nome_completo like "%Gabriel%";  

-- Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.
SELECT enfermeiro.nome_completo, enfermeiro.cre, COUNT(internacao.enfermeiro_fk) AS Participacao 
FROM enfermeiro 
INNER JOIN internacao 
ON enfermeiro.id_enfermeiro = internacao.enfermeiro_fk 
GROUP BY enfermeiro.id_enfermeiro 
HAVING Participacao > 1; 
  
