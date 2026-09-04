-- LIMPANDO AS TABELAS JÁ EXISTENTES (CASO EXISTAN), NA ORDEM DE DEPENDENCIA

    DROP TABLE IF EXISTS `itempedido`;
    DROP TABLE IF EXISTS `pedido`;
    DROP TABLE IF EXISTS `produto`;
    DROP TABLE IF EXISTS `categoria`;
    DROP TABLE IF EXISTS `cliente`;
    DROP TABLE IF EXISTS `fornecedor`;
    DROP TABLE IF EXISTS `marca`;

-- CRIANDO & POPULANDO TABELA DE CATEGORIA

    CREATE TABLE IF NOT EXISTS `categoria` (
        `id` BIGINT NOT NULL AUTO_INCREMENT,
        `descricao` VARCHAR(255) NOT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

    INSERT INTO `categoria` (`descricao`) VALUES
    ('Achocolatado');

-- CRIANDO & POPULANDO TABELA DE CLIENTE

    CREATE TABLE IF NOT EXISTS `cliente` (
        `id` BIGINT NOT NULL AUTO_INCREMENT,
        `nome` VARCHAR(255) NOT NULL,
        `login` VARCHAR(255) NOT NULL,
        `senha` VARCHAR(255) NOT NULL,
        `dtnasc` DATE NOT NULL,
        `endereco` VARCHAR(255) NOT NULL,
        `sexo` int(1) NOT NULL,
        `cpf` VARCHAR(20) NOT NULL,
        `rg` VARCHAR(20) NOT NULL,
        `telefone` VARCHAR(20) NOT NULL,
        `celular` VARCHAR(20) NOT NULL,
        PRIMARY KEY(`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

    INSERT INTO `cliente` (`nome`, `login`, `senha`, `dtnasc`, `endereco`, `sexo`, `cpf`, `rg`, `telefone`, `celular`) VALUES
    ('Aluno2314', 'aluno', '123456','1983-07-02', 'Rua Tiradentes', 1, '225.962.590-87', '40.252.991-1', '(43)3333-3333', '(43)3344-3344');

-- CRIANDO & POPULANDO TABELA DE FORNECEDOR

    CREATE TABLE IF NOT EXISTS `fornecedor` (
        `id` BIGINT NOT NULL AUTO_INCREMENT,
        `nome` VARCHAR(255) NOT NULL,
        `telefone` VARCHAR(255) NOT NULL,
        PRIMARY KEY(`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

    INSERT INTO `fornecedor` (`nome`, `telefone`) VALUES
    ('Unopar', '(43)3333-3333');

-- CRIANDO & POPULANDO TABELA DE MARCA
    
    CREATE TABLE IF NOT EXISTS `marca` (
        `id` BIGINT NOT NULL AUTO_INCREMENT,
        `descricao` VARCHAR(255) NOT NULL,
        PRIMARY KEY(`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

    INSERT INTO `marca` (`descricao`) VALUES
    ('Native'), ('Nestle');

-- CRIANDO & POPULANDO TABELA DE PRODUTO

    CREATE TABLE IF NOT EXISTS `produto` (
        `id` BIGINT NOT NULL AUTO_INCREMENT,
        `id_categoria` BIGINT NOT NULL,
        `id_marca` BIGINT NOT NULL,
        `nome` VARCHAR(255) NOT NULL,
        `descricao` VARCHAR(255) NOT NULL,
        `estoque` INT(10) NOT NULL,
        `preco` DOUBLE NOT NULL,
        PRIMARY KEY (`id`),
        CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`),
        CONSTRAINT `fk_produto_marca` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

    INSERT INTO `produto` (`id_categoria`, `id_marca`, `nome`, `descricao`, `estoque`, `preco`) VALUES
    (1, 2, 'Nescau', 'Achocolatado em pó', 2, 20.3),
    (1, 1, 'Cereal', 'Cereal Nutritivo', 17, 10.35),
    (1, 1, 'Biscoito', 'Biscoito Bono', 50, 2);


-- CRIANDO & POPULANDO TABELA DE PEDIDO

    CREATE TABLE IF NOT EXISTS `pedido` (
        `id` BIGINT NOT NULL AUTO_INCREMENT,
        `id_cliente` BIGINT NOT NULL,
        `id_fornecedor` BIGINT NOT NULL,
        `data` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `status` char(1) not null,
        PRIMARY KEY(`id`),
        CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
        CONSTRAINT `fk_pedido_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

    INSERT INTO `pedido` (`id_cliente`, `id_fornecedor`, `data`, `status`) VALUES
    (1, 1, '2021-09-29 08:34:20', 'E'),
    (1, 1, '2021-09-30 12:05:28', 'E'),
    (1, 1, '2021-09-30 12:06:47', 'E');

-- CRIANDO & POPULANDO TABELA DE ITENS DE PEDIDO

    CREATE TABLE IF NOT EXISTS `itempedido` (
        `id` BIGINT NOT NULL AUTO_INCREMENT,
        `id_pedido` BIGINT NOT NULL,
        `id_produto` BIGINT NOT NULL,
        `seq` BIGINT NOT NULL,
        `qtde` BIGINT NOT NULL,
        PRIMARY KEY(`id`),
        CONSTRAINT `fk_itempedido_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`),
        CONSTRAINT `fk_itempedido_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

    INSERT INTO `itempedido` (`id_pedido`, `id_produto`, `seq`, `qtde`) VALUES
    (1,1,1,2),
    (1,2,2,1),
    (2,1,1,3),
    (2,2,2,3),
    (3,1,1,3);

