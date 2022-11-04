# Hospital Fundamental



### Descrição
O Hospital Fundamental foi uma atividade exigida durante o curso no Instituto PROA, ao decorrer dos exercicios é necessário criar um banco de dados desde o ínicio, passando pela modelagem de dados (criando um Diagrama Entidade-Relacionamento) até a criação do modelo físico, tornando o banco de dados funcional.
<div align='center'>
<img width='500px' src='https://user-images.githubusercontent.com/111239606/199851587-7ab4e7ce-150e-442b-a27b-cce39b8f9d51.gif'>
</div>

### Parte 1
Um pequeno hospital local busca desenvolver um novo sistema que atenda melhor às suas necessidades, espera-se que os dados sejam transferidos para o novo sistema assim que ele estiver funcional. Neste momento, o hospital necessita de um sistema para sua área clínica que ajude a controlar consultas realizadas, sendo necessário analisar com cuidado as necessidades desse cliente e sugerir uma estrutura de banco de dados adequada por meio de um Diagrama Entidade-Relacionamento.<br><br>

> Os médicos podem ser generalistas, especialistas ou residentes e têm seus dados pessoais cadastrados em planilhas digitais. Cada médico pode ter uma ou mais especialidades, que podem ser pediatria, clínica geral, gastroenterologia e dermatologia. Alguns registros antigos ainda estão em formulário de papel, mas será necessário incluir esses dados no novo sistema.

> Os pacientes também precisam de cadastro, contendo dados pessoais (nome, data de nascimento, endereço, telefone e e-mail), documentos (CPF e RG) e convênio. Para cada convênio, são registrados nome, CNPJ e tempo de carência.

> As consultas também têm sido registradas com data e hora de realização, médico responsável, paciente, valor da consulta ou nome do convênio, com o número da carteira. Também é necessário indicar na consulta qual a especialidade buscada pelo paciente.

> Deseja-se ainda informatizar a receita do médico, de maneira que, no encerramento da consulta, ele possa registrar os medicamentos receitados, a quantidade e as instruções de uso.

<img src='https://user-images.githubusercontent.com/111239606/199850096-4fd3db56-0c63-4997-97d6-7f6d48ebe39e.png'><br><br>

### Parte 2
Após a primeira versão do projeto de banco de dados para o sistema hospitalar, notou-se a necessidade de expansão das funcionalidades,senda elas para o controle na internação de pacientes. Será necessário expandir o Modelo ER desenvolvido e montar o banco de dados, criando as tabelas para o início dos testes.<br><br>
>Para cada internação, são anotadas a data de entrada, a data prevista de alta e a data efetiva de alta, além da descrição textual dos procedimentos a serem realizados.

>As internações precisam ser vinculadas a quartos, com a numeração e o tipo.

>Cada tipo de quarto tem sua descrição e o seu valor diário (a princípio, o hospital trabalha com apartamentos, quartos duplos e enfermaria).

>Também é necessário controlar quais profissionais de enfermaria estarão responsáveis por acompanhar o paciente durante sua internação. Para cada enfermeiro(a), é necessário nome, CPF e registro no conselho de enfermagem (CRE).

>A internação, obviamente, é vinculada a um paciente – que pode se internar mais de uma vez no hospital – e a um único médico responsável.<br><br>

<div align='center'>
<img src='https://user-images.githubusercontent.com/111239606/199850715-9de1232a-0b17-4758-8b9c-af0de0c4e534.png'>
</div><br><br>

>Por último, crie um script SQL para a geração do banco de dados<br>
```
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
  `endereco` int,
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

ALTER TABLE `medico` ADD FOREIGN KEY (`endereco`) REFERENCES `endereco` (`id_endereco`);

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
```
<br>

### Parte 3 - Alimentando o Banco de Dados
Com o banco de dados para o sistema hospitalar completamente montado, é necessário incluir dados para realizar os devidos testes e validar sua viabilidade quanto ao sistema. <br><br>
>Inclua ao menos dez médicos de ao menos sete especialidades (considere a afirmação de que “entre as especialidades há pediatria, clínica geral, gastroenterologia e dermatologia”).<br>

`Inserindo dados na tabela 'cargo': ` 
```
INSERT INTO cargo(id_cargo, nome_cargo) 
VALUES (null, 'Generalista');

INSERT INTO cargo(id_cargo, nome_cargo) 
VALUES (null, 'Especialista');

INSERT INTO cargo(id_cargo, nome_cargo) 
VALUES (null, 'Residente');
```
`Inserindo dados na tabela 'especialidade':`
```
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
```
`Inserindo dados e endereços dos médicos`
```
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
```
