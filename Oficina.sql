create database Oficina;
use Oficina;
CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Telefone VARCHAR(15),
    Endereco VARCHAR(255)
);

CREATE TABLE Veiculos (
    ID INT PRIMARY KEY,
    Modelo VARCHAR(50),
    Ano INT,
    Placa VARCHAR(10),
    Cliente_ID INT,
    FOREIGN KEY (Cliente_ID) REFERENCES Clientes(ID)
);

CREATE TABLE Funcionarios (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Cargo VARCHAR(50),
    DataContratacao DATE
);

CREATE TABLE Servicos (
    ID INT PRIMARY KEY,
    Descricao VARCHAR(255),
    Preco DECIMAL(10, 2)
);

CREATE TABLE OrdensDeServico (
    ID INT PRIMARY KEY,
    DataInicio DATE,
    DataConclusao DATE,
    Veiculo_ID INT,
    Funcionario_ID INT,
    FOREIGN KEY (Veiculo_ID) REFERENCES Veiculos(ID),
    FOREIGN KEY (Funcionario_ID) REFERENCES Funcionarios(ID)
);

CREATE TABLE ServicosRealizados (
    Ordem_ID INT,
    Servico_ID INT,
    FOREIGN KEY (Ordem_ID) REFERENCES OrdensDeServico(ID),
    FOREIGN KEY (Servico_ID) REFERENCES Servicos(ID)
);

SELECT Nome, Telefone FROM Clientes;

SELECT Modelo, Ano FROM Veiculos WHERE Ano > 2015;

SELECT Nome, CONCAT('Cargo: ', Cargo) AS Informacoes FROM Funcionarios;

SELECT Descricao, Preco FROM Servicos ORDER BY Preco DESC;

SELECT Funcionario_ID, COUNT(*) AS TotalServicos FROM OrdensDeServico GROUP BY Funcionario_ID HAVING TotalServicos > 5;

SELECT c.Nome, v.Modelo FROM Clientes c
INNER JOIN Veiculos v ON c.ID = v.Cliente_ID;
