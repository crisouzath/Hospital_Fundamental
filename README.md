# Hospital Fundamental



### Descrição
O Hospital Fundamental foi uma atividade exigida durante o curso no Instituto PROA, ao decorrer dos exercicios é necessário criar um banco de dados desde o ínicio, passando pela modelagem de dados (criando um Diagrama Entidade-Relacionamento) até a criação do modelo físico, tornando o banco de dados funcional.
<div align='center'>
<img width='500px' src='https://user-images.githubusercontent.com/111239606/199851587-7ab4e7ce-150e-442b-a27b-cce39b8f9d51.gif'>
</div>

### PARTE 1
Um pequeno hospital local busca desenvolver um novo sistema que atenda melhor às suas necessidades, espera-se que os dados sejam transferidos para o novo sistema assim que ele estiver funcional. Neste momento, o hospital necessita de um sistema para sua área clínica que ajude a controlar consultas realizadas, sendo necessário analisar com cuidado as necessidades desse cliente e sugerir uma estrutura de banco de dados adequada por meio de um Diagrama Entidade-Relacionamento.<br><br>

> Os médicos podem ser generalistas, especialistas ou residentes e têm seus dados pessoais cadastrados em planilhas digitais. Cada médico pode ter uma ou mais especialidades, que podem ser pediatria, clínica geral, gastroenterologia e dermatologia. Alguns registros antigos ainda estão em formulário de papel, mas será necessário incluir esses dados no novo sistema.

> Os pacientes também precisam de cadastro, contendo dados pessoais (nome, data de nascimento, endereço, telefone e e-mail), documentos (CPF e RG) e convênio. Para cada convênio, são registrados nome, CNPJ e tempo de carência.

> As consultas também têm sido registradas com data e hora de realização, médico responsável, paciente, valor da consulta ou nome do convênio, com o número da carteira. Também é necessário indicar na consulta qual a especialidade buscada pelo paciente.

> Deseja-se ainda informatizar a receita do médico, de maneira que, no encerramento da consulta, ele possa registrar os medicamentos receitados, a quantidade e as instruções de uso.

<img src='https://user-images.githubusercontent.com/111239606/199850096-4fd3db56-0c63-4997-97d6-7f6d48ebe39e.png'><br><br>

### PARTE 2
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
```
<br>

### PARTE 3 - Alimentando o Banco de Dados
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
```
`Inserindo dados e endereços dos médicos`
```
INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua dos Palmares', '45', '09032-090');

INSERT INTO medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) 
VALUES (null, 'Eduardo Alves da Silva', 1, '(11)99678-9999', '337.787.888-00', '30.456.432-3', 2, 1);
```
<br>

>Inclua ao menos 15 pacientes.

>Registre 20 consultas de diferentes pacientes e diferentes médicos (alguns pacientes realizam mais que uma consulta). As consultas devem ter ocorrido entre 01/01/2015 e 01/01/2022. Ao menos dez consultas devem ter receituário com dois ou mais medicamentos.

>Inclua ao menos quatro convênios médicos, associe ao menos cinco pacientes e cinco consultas.

`Adicionando dados a tabela 'convênio'`
```
INSERT INTO convenio(id_convenio, nome, cnpj, tempo_carencia) 
VALUES (null, 'AMIvida', '23.400.768/0001-43', '24 horas');
```
`Cadastrando os pacientes e seus endereços`
```
INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Getúlio Vargas', '267', '85818-680');

INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Ruan Mota', '2001-02-19', 11,'ruan.mota@gmail.com', '(11)98597-4585', '245.505.673-25', '38.571.245-5', 1);

```
`Cadastrando as consultas e criando as receitas`
```
INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 1,8, "Dipirona", "1 comprimido","1 comprimido a cada dois dias no periodo de uma semana");

INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '2015-06-38', '10:00:00', 8, 1, 100.00, null, 1, 3);
```
<br>

>Registre ao menos sete internações. Pelo menos dois pacientes devem ter se internado mais de uma vez. Ao menos três quartos devem ser cadastrados. As internações devem ter ocorrido entre 01/01/2015 e 01/01/2022.

>Considerando que “a princípio o hospital trabalha com apartamentos, quartos duplos e enfermaria”, inclua ao menos esses três tipos com valores diferentes.

>Inclua dados de dez profissionais de enfermaria. Associe cada internação a ao menos dois enfermeiros.

`Inserindo os tipos de quartos`
```
INSERT INTO tipo_quarto(id_tipo,descricao,valor_diaria) 
VALUES (null, 'Quarto duplo', 4000.00);

INSERT INTO tipo_quarto(id_tipo,descricao,valor_diaria) 
VALUES (null, 'Apartamento', 6000.00);

INSERT INTO tipo_quarto(id_tipo,descricao,valor_diaria) 
VALUES (null, 'Enfermaria', 2000.00);
```
`Inserindo dados dos quartos`
```
INSERT INTO quarto(id_quarto, numero, tipo_fk) 
VALUES (null, 456, 1);
```
`Inserindo os dados dos enfermeiros`
```
INSERT INTO enfermeiro(id_enfermeiro, nome_completo, cpf, cre) 
VALUES (null, 'Angelo Domingues', '87459612', '784169');
```
`Adicionando internações`
```
INSERT INTO internacao(id_internacao, quarto_fk, paciente_fk, medico_fk, enfermeiro_fk, enfermeiro_auxiliar_fk, data_entrada, data_prev_saida, data_alta, procedimento)
VALUES(null, 1, 12, 6, 1, 2, '2015-12-08', '2016-01-04', '2016-01-10', "Trocar as bombas de redenção de liquido");
```
<br>

### PARTE 4 - Alterando o banco de dados
Pensando no banco que já foi criado para o Projeto do Hospital, realize algumas alterações nas tabelas e nos dados usando comandos de atualização e exclusão
>Crie um script que adicione uma coluna “em_atividade” para os médicos, indicando se ele ainda está atuando no hospital ou não. 

```
ALTER TABLE medico ADD em_atividade varchar(255);
```
>Crie um script para atualizar ao menos dois médicos como inativos e os demais em atividade.

```
UPDATE medico SET em_atividade = CASE id_medico
WHEN 1 THEN 'Ativo'
WHEN 2 THEN 'Ativo'
WHEN 3 THEN 'Inativo'
WHEN 4 THEN 'Ativo'
WHEN 5 THEN 'Ativo'
WHEN 6 THEN 'Ativo'
WHEN 7 THEN 'Inativo'
WHEN 8 THEN 'Ativo'
WHEN 9 THEN 'Ativo'
WHEN 10 THEN 'Ativo'
END
WHERE id_medico IN (1,2,3,4,5,6,7,8,9,10)
```

### PARTE 5 - Consultas
Crie um script e nele inclua consultas que retornem:
>Todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas sob convênio.

```
SELECT *, AVG(valor_consulta) 
FROM consulta 
GROUP BY convenio_fk 
HAVING YEAR(data) = '2020';
```

>Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta.

```
SELECT * 
FROM internacao 
WHERE data_alta > data_prev_saida;
```

>Receituário completo da primeira consulta registrada com receituário associado.
```
SELECT receita.medicamentos, receita.quantidade, receita.instrucoes, paciente.nome_completo AS paciente_nome, medico.nome_completo AS medico_paciente  
FROM receita 
INNER JOIN paciente 
ON receita.paciente_fk=paciente.id_paciente
INNER JOIN medico 
ON receita.medico_fk=medico.id_medico
ORDER BY receita.id_receita
LIMIT 1;
```

>Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio).

```
select *, MAX(valor_consulta), MIN(valor_consulta) 
FROM consulta 
GROUP BY convenio_fk IS NULL;
```

>Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta.

```
SELECT internacao.id_internacao, quarto.id_quarto, DATEDIFF(data_alta, data_entrada) AS dias_em_uso, tipo_quarto.valor_diaria, DATEDIFF(data_alta, data_entrada) * tipo_quarto.valor_diaria valor_total 
FROM internacao
INNER JOIN quarto 
ON internacao.quarto_fk = quarto.id_quarto
INNER JOIN tipo_quarto
ON quarto.tipo_fk = tipo_quarto.id_tipo 
GROUP BY id_internacao;
```

>Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.

```
 SELECT internacao.data_entrada, internacao.procedimento, quarto.numero 
 FROM internacao 
 INNER JOIN quarto 
 ON quarto.id_quarto = internacao.quarto_fk 
 WHERE quarto.tipo_fk = 2;
```

>Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta.

```
SELECT paciente.nome_completo, consulta.data, especialidade.nome_especialidade 
FROM consulta 
INNER JOIN paciente 
ON paciente.id_paciente = consulta.paciente_fk 
INNER JOIN especialidade 
ON especialidade.id_especialidade = consulta.especialidade 
WHERE consulta.especialidade <> 1 AND YEAR(consulta.data) - YEAR(paciente.data_nascimento) < 19 AND YEAR(consulta.data) - YEAR(paciente.data_nascimento) > 0
ORDER BY consulta.data;
```

>Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.

```
SELECT paciente.nome_completo, medico.nome_completo, internacao.data_entrada, internacao.procedimento, quarto.tipo_fk 
FROM internacao
INNER JOIN medico 
ON medico.id_medico = internacao.medico_fk
INNER JOIN paciente 
ON paciente.id_paciente = internacao.paciente_fk 
INNER JOIN quarto 
ON quarto.id_quarto = internacao.quarto_fk 
WHERE quarto.tipo_fk = 3 AND medico.especialidade_fk = 3;
```

>Os nomes dos médicos e a quantidade de consultas que cada um realizou.

```
SELECT medico.nome_completo, COUNT(consulta.medico_fk) AS 'Quantidade de consultas' 
FROM medico
INNER JOIN consulta 
ON medico.id_medico = consulta.medico_fk
GTOUP BY consulta.medico_fk;

```

>Todos os médicos que tenham "Gabriel" no nome.

```
SELECT * 
FROM medico 
WHERE nome_completo LIKE "%Gabriel%";
```

>Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.

```
SELECT enfermeiro.nome_completo, enfermeiro.cre, COUNT(internacao.enfermeiro_fk) AS Participacao 
FROM enfermeiro 
INNER JOIN internacao 
ON enfermeiro.id_enfermeiro = internacao.enfermeiro_fk 
GROUP BY enfermeiro.id_enfermeiro 
HAVING Participacao > 1;

```
