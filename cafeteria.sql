-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07/05/2025 às 20:10
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cafeteria`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `cliente_id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `nome`, `email`, `telefone`, `cpf`) VALUES
(1, 'Carlos Silva', 'carlos@email.com', '11999990001', '123.456.789-01'),
(2, 'Ana Souza', 'ana@email.com', '11999990002', '123.456.789-02'),
(3, 'Mariana Lima', 'mariana@email.com', '11999990003', '123.456.789-03'),
(4, 'Felipe Costa', 'felipe@email.com', '11999990004', '123.456.789-04'),
(5, 'Juliana Alves', 'juliana@email.com', '11999990005', '123.456.789-05'),
(6, 'Roberto Dias', 'roberto@email.com', '11999990006', '123.456.789-06'),
(7, 'Fernanda Castro', 'fernanda@email.com', '11999990007', '123.456.789-07'),
(8, 'Bruno Martins', 'bruno@email.com', '11999990008', '123.456.789-08'),
(9, 'Patrícia Gomes', 'patricia@email.com', '11999990009', '123.456.789-09'),
(10, 'Ricardo Moreira', 'ricardo@email.com', '11999990010', '123.456.789-10'),
(11, 'Amanda Barros', 'amanda@email.com', '11999990011', '123.456.789-11'),
(12, 'Thiago Ferreira', 'thiago@email.com', '11999990012', '123.456.789-12'),
(13, 'Isabela Mendes', 'isabela@email.com', '11999990013', '123.456.789-13'),
(14, 'Luciana Ramos', 'luciana@email.com', '11999990014', '123.456.789-14'),
(15, 'André Lopes', 'andre@email.com', '11999990015', '123.456.789-15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

CREATE TABLE `estoque` (
  `produto_id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `quantidade` int(11) DEFAULT 0,
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estoque`
--

INSERT INTO `estoque` (`produto_id`, `nome`, `quantidade`, `valor`) VALUES
(1, 'Café Espresso', 100, 7.00),
(2, 'Cappuccino', 80, 9.50),
(3, 'Latte', 70, 9.00),
(4, 'Mocha', 60, 10.00),
(5, 'Chá Gelado', 50, 6.00),
(6, 'Bolo de Chocolate', 30, 12.00),
(7, 'Bolo de Cenoura', 25, 11.00),
(8, 'Croissant', 40, 8.00),
(9, 'Pão de Queijo', 100, 5.00),
(10, 'Torrada com Manteiga', 50, 4.50);

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pedido`
--

CREATE TABLE `item_pedido` (
  `item_pedido_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `produto_nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `item_pedido`
--

INSERT INTO `item_pedido` (`item_pedido_id`, `produto_id`, `pedido_id`, `quantidade`, `produto_nome`) VALUES
(11, 1, 1, 2, 'Café Espresso'),
(12, 2, 2, 1, 'Cappuccino'),
(13, 3, 3, 1, 'Latte'),
(14, 4, 4, 1, 'Mocha'),
(15, 5, 5, 2, 'Chá Gelado'),
(16, 6, 6, 1, 'Bolo de Chocolate'),
(17, 7, 7, 1, 'Bolo de Cenoura'),
(18, 8, 8, 3, 'Croissant'),
(19, 9, 9, 2, 'Pão de Queijo'),
(20, 10, 10, 2, 'Torrada com Manteiga');

-- --------------------------------------------------------

--
-- Estrutura para tabela `licencas`
--

CREATE TABLE `licencas` (
  `licenca_id` int(11) NOT NULL,
  `nome_licenca` varchar(100) NOT NULL,
  `cnpj` varchar(18) NOT NULL,
  `orgao_responsavel` varchar(100) NOT NULL,
  `data_validade` date NOT NULL,
  `prazo_expiracao` enum('30','60','90','140') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `licencas`
--

INSERT INTO `licencas` (`licenca_id`, `nome_licenca`, `cnpj`, `orgao_responsavel`, `data_validade`, `prazo_expiracao`) VALUES
(1, 'Alvará de Funcionamento', '12.345.678/0001-90', 'Prefeitura', '2025-12-31', '90'),
(2, 'Licença Ambiental', '23.456.789/0001-80', 'Ibama', '2025-11-15', '60'),
(3, 'Registro Sanitário', '34.567.890/0001-70', 'Anvisa', '2025-10-10', '30');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `pedido_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `data_pedido` date NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`pedido_id`, `cliente_id`, `usuario_id`, `data_pedido`, `valor`) VALUES
(1, 1, NULL, '2025-05-01', 14.00),
(2, 2, NULL, '2025-05-01', 9.50),
(3, 3, NULL, '2025-05-02', 9.00),
(4, 4, NULL, '2025-05-02', 10.00),
(5, 5, NULL, '2025-05-03', 12.00),
(6, 6, NULL, '2025-05-04', 12.00),
(7, 7, NULL, '2025-05-05', 11.00),
(8, 8, NULL, '2025-05-05', 24.00),
(9, 9, NULL, '2025-05-06', 10.00),
(10, 10, NULL, '2025-05-06', 9.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL,
  `nome_usuario` varchar(50) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo_usuario` enum('admin','usuario','gerente') DEFAULT 'usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nome_usuario`, `senha`, `tipo_usuario`) VALUES
(1, 'ruan', 'admin123', 'admin'),
(2, 'yasmin', 'senha123', 'usuario'),
(3, 'gabriel', 'senha123', 'usuario'),
(4, 'alexandre', 'senha123', 'gerente'),
(5, 'carlos', 'senha123', 'usuario');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`produto_id`);

--
-- Índices de tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD PRIMARY KEY (`item_pedido_id`),
  ADD KEY `produto_id` (`produto_id`),
  ADD KEY `pedido_id` (`pedido_id`);

--
-- Índices de tabela `licencas`
--
ALTER TABLE `licencas`
  ADD PRIMARY KEY (`licenca_id`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`pedido_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `nome_usuario` (`nome_usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `produto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  MODIFY `item_pedido_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `licencas`
--
ALTER TABLE `licencas`
  MODIFY `licenca_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `pedido_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD CONSTRAINT `item_pedido_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `estoque` (`produto_id`),
  ADD CONSTRAINT `item_pedido_ibfk_2` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`);

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
