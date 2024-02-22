-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22-Fev-2024 às 18:57
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdlitera`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbadmin`
--

CREATE TABLE `tbadmin` (
  `codAdmin` int(11) NOT NULL,
  `nomeAdmin` varchar(100) NOT NULL,
  `emailAdmin` varchar(100) NOT NULL,
  `senhaAdmin` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbavatar`
--

CREATE TABLE `tbavatar` (
  `codAvatar` int(11) NOT NULL,
  `generoAvatar` varchar(50) NOT NULL,
  `cabeloAvatar` varchar(50) NOT NULL,
  `roupaAvatar` varchar(50) NOT NULL,
  `codUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbjogo`
--

CREATE TABLE `tbjogo` (
  `codJogo` int(11) NOT NULL,
  `nomeJogo` varchar(50) NOT NULL,
  `descJogo` text NOT NULL,
  `nivelJogo` int(11) NOT NULL,
  `pontuacaoJogo` int(11) NOT NULL,
  `dificuldadeJogo` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbjogousuario`
--

CREATE TABLE `tbjogousuario` (
  `codJogousuario` int(11) NOT NULL,
  `codUsuario` int(11) NOT NULL,
  `codJogo` int(11) NOT NULL,
  `nivelUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbusuario`
--

CREATE TABLE `tbusuario` (
  `codUsuario` int(11) NOT NULL,
  `nomeUsuario` varchar(100) NOT NULL,
  `emailUsuario` varchar(120) NOT NULL,
  `senhaUsuario` varchar(15) NOT NULL,
  `pontuacaoUsuario` int(11) NOT NULL,
  `dinheiroUsuario` int(11) NOT NULL,
  `tuturialUsuario` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbadmin`
--
ALTER TABLE `tbadmin`
  ADD PRIMARY KEY (`codAdmin`),
  ADD UNIQUE KEY `emailAdmin` (`emailAdmin`);

--
-- Índices para tabela `tbavatar`
--
ALTER TABLE `tbavatar`
  ADD PRIMARY KEY (`codAvatar`),
  ADD KEY `avatarUsuario` (`codUsuario`);

--
-- Índices para tabela `tbjogo`
--
ALTER TABLE `tbjogo`
  ADD PRIMARY KEY (`codJogo`);

--
-- Índices para tabela `tbjogousuario`
--
ALTER TABLE `tbjogousuario`
  ADD PRIMARY KEY (`codJogousuario`),
  ADD KEY `usuarioJogo` (`codUsuario`),
  ADD KEY `jogoUsario` (`codJogo`);

--
-- Índices para tabela `tbusuario`
--
ALTER TABLE `tbusuario`
  ADD PRIMARY KEY (`codUsuario`),
  ADD UNIQUE KEY `emailUsuario` (`emailUsuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbadmin`
--
ALTER TABLE `tbadmin`
  MODIFY `codAdmin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbavatar`
--
ALTER TABLE `tbavatar`
  MODIFY `codAvatar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbjogo`
--
ALTER TABLE `tbjogo`
  MODIFY `codJogo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbjogousuario`
--
ALTER TABLE `tbjogousuario`
  MODIFY `codJogousuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbusuario`
--
ALTER TABLE `tbusuario`
  MODIFY `codUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tbavatar`
--
ALTER TABLE `tbavatar`
  ADD CONSTRAINT `avatarUsuario` FOREIGN KEY (`codUsuario`) REFERENCES `tbusuario` (`codUsuario`);

--
-- Limitadores para a tabela `tbjogousuario`
--
ALTER TABLE `tbjogousuario`
  ADD CONSTRAINT `jogoUsario` FOREIGN KEY (`codJogo`) REFERENCES `tbjogo` (`codJogo`),
  ADD CONSTRAINT `usuarioJogo` FOREIGN KEY (`codUsuario`) REFERENCES `tbusuario` (`codUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
