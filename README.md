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
Após a primeira versão do projeto de banco de dados para o sistema hospitalar, notou-se a necessidade de expansão das funcionalidades,senda elas para o controle na internação de pacientes. Será necessário expandir o Modelo ER desenvolvido e montar o banco de dados, criando as tabelas para o início dos testes.
>Para cada internação, são anotadas a data de entrada, a data prevista de alta e a data efetiva de alta, além da descrição textual dos procedimentos a serem realizados.

>As internações precisam ser vinculadas a quartos, com a numeração e o tipo.

>Cada tipo de quarto tem sua descrição e o seu valor diário (a princípio, o hospital trabalha com apartamentos, quartos duplos e enfermaria).

>Também é necessário controlar quais profissionais de enfermaria estarão responsáveis por acompanhar o paciente durante sua internação. Para cada enfermeiro(a), é necessário nome, CPF e registro no conselho de enfermagem (CRE).

>A internação, obviamente, é vinculada a um paciente – que pode se internar mais de uma vez no hospital – e a um único médico responsável.

>uma seta

>>duas

>>>tres

<div align='center'>
<img src='https://user-images.githubusercontent.com/111239606/199850715-9de1232a-0b17-4758-8b9c-af0de0c4e534.png'>
</div>
