-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 05-Mar-2021 às 23:35
-- Versão do servidor: 5.7.31
-- versão do PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbsistemavendapaineis`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbadministrador`
--

DROP TABLE IF EXISTS `tbadministrador`;
CREATE TABLE IF NOT EXISTS `tbadministrador` (
  `Nome` varchar(100) NOT NULL,
  `Cpf` varchar(15) NOT NULL,
  `Usuario` varchar(15) NOT NULL,
  `Senha` varchar(15) NOT NULL,
  `TipoUsuario` int(5) NOT NULL,
  PRIMARY KEY (`Cpf`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbadministrador`
--

INSERT INTO `tbadministrador` (`Nome`, `Cpf`, `Usuario`, `Senha`, `TipoUsuario`) VALUES
('joana', '08706599605', 'juju', '1985', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcliente`
--

DROP TABLE IF EXISTS `tbcliente`;
CREATE TABLE IF NOT EXISTS `tbcliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `CPF` varchar(14) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Telefone` varchar(15) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `Cidade` varchar(20) NOT NULL,
  `Bairro` varchar(20) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbcliente`
--

INSERT INTO `tbcliente` (`idCliente`, `CPF`, `Nome`, `Telefone`, `Estado`, `Cidade`, `Bairro`) VALUES
(2, '087.065.996-05', 'joana', '31997572909', 'MG', 'Vicosa', 'Santa Clara'),
(3, '098.777.554-33', 'Miguel', '3297467345', 'MG', 'Vicosa', 'Santa Clara'),
(7, '224.353.446-45', 'Maria Julia', '(31)74545-4387', 'MG', 'Vicosa', 'Lajinha'),
(11, '123.456.789-88', 'Sonia Souza', '(31)66667-7888', 'MG', 'Vicosa', 'Santa Clara');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcompra`
--

DROP TABLE IF EXISTS `tbcompra`;
CREATE TABLE IF NOT EXISTS `tbcompra` (
  `IdCompra` int(11) NOT NULL AUTO_INCREMENT,
  `Idfornecedor` int(11) NOT NULL,
  `DataCompra` date NOT NULL,
  `ValorTotal` float(30,0) NOT NULL,
  PRIMARY KEY (`IdCompra`),
  KEY `FK_CodigoFornecedor_idx` (`Idfornecedor`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbfornecedor`
--

DROP TABLE IF EXISTS `tbfornecedor`;
CREATE TABLE IF NOT EXISTS `tbfornecedor` (
  `Idfornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `CNPJ` varchar(18) NOT NULL,
  `Estado` varchar(15) NOT NULL,
  `Cidade` varchar(40) NOT NULL,
  `Telefone` varchar(15) NOT NULL,
  PRIMARY KEY (`Idfornecedor`),
  UNIQUE KEY `Cidade` (`Idfornecedor`,`Nome`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbfornecedor`
--

INSERT INTO `tbfornecedor` (`Idfornecedor`, `Nome`, `CNPJ`, `Estado`, `Cidade`, `Telefone`) VALUES
(1, 'Solares', '232.423.432-43', 'MG', 'Vicosa', '(31)87346-7367'),
(2, 'Azul', '352.352.345-23', 'MG', 'Vicosa', '(31)43232-4564'),
(3, 'Brillanye', '342.343.435-43', 'SC', 'bambu', '(24)12432-4324');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbfuncionario`
--

DROP TABLE IF EXISTS `tbfuncionario`;
CREATE TABLE IF NOT EXISTS `tbfuncionario` (
  `IdFuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(15) NOT NULL,
  `Senha` varchar(15) NOT NULL,
  `Cpf` varchar(15) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Tipo_usuario` int(11) NOT NULL,
  PRIMARY KEY (`IdFuncionario`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbfuncionario`
--

INSERT INTO `tbfuncionario` (`IdFuncionario`, `Usuario`, `Senha`, `Cpf`, `Nome`, `Tipo_usuario`) VALUES
(1, 'joanab', '291985', '087.065.996-05', 'Joana Paula', 1),
(2, 'joanab', '291985', '087.065.996-05', 'Joana Paula', 1),
(3, 'jujubb', '234567', '324.253.534-54', 'Joana', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbitemcompra`
--

DROP TABLE IF EXISTS `tbitemcompra`;
CREATE TABLE IF NOT EXISTS `tbitemcompra` (
  `IdItemCompra` int(11) NOT NULL AUTO_INCREMENT,
  `IdPainel` int(11) NOT NULL,
  `IdCompra` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `ValorUnitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IdItemCompra`),
  KEY `FK_CodigoCompra_idx2` (`IdCompra`),
  KEY `FK_CodigoProduto_idx2` (`IdPainel`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbitemvenda`
--

DROP TABLE IF EXISTS `tbitemvenda`;
CREATE TABLE IF NOT EXISTS `tbitemvenda` (
  `IdItemVenda` int(11) NOT NULL AUTO_INCREMENT,
  `IdPainel` int(11) NOT NULL,
  `IdVenda` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `ValorUnitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IdItemVenda`),
  KEY `FK_CodigoVenda_idx` (`IdVenda`),
  KEY `FK_CodigoProduto_idx` (`IdPainel`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbproduto`
--

DROP TABLE IF EXISTS `tbproduto`;
CREATE TABLE IF NOT EXISTS `tbproduto` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `PrecoCompra` float(30,0) NOT NULL,
  `PrecoVenda` float(30,0) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `Descricao` text NOT NULL,
  `Marca` varchar(50) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbproduto`
--

INSERT INTO `tbproduto` (`idProduto`, `PrecoCompra`, `PrecoVenda`, `Quantidade`, `Descricao`, `Marca`, `Nome`) VALUES
(1, 5, 8, 8, 'café toko 250 gramas', 'Toko', 'cafe'),
(2, 4, 7, 8, 'zvcxb cx', 'bvcbv', 'efrwfref'),
(3, 3, 8, 5, 'pao de forma netto', 'netto', 'pao');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbvenda`
--

DROP TABLE IF EXISTS `tbvenda`;
CREATE TABLE IF NOT EXISTS `tbvenda` (
  `IdVenda` int(11) NOT NULL AUTO_INCREMENT,
  `IdCliente` int(11) NOT NULL,
  `DataVenda` date NOT NULL,
  `ValorTotal` float(30,0) NOT NULL,
  PRIMARY KEY (`IdVenda`),
  KEY `FK_CodigoCliente_idx` (`IdCliente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
