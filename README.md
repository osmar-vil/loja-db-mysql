# Loja DB - MySQL

Script de criação e configuração do banco de dados relacional para um sistema de pedidos, desenvolvido como atividade prática sobre modelagem e implementação de banco de dados em servidor web.

## 📋 Sobre o projeto

Este repositório contém o script SQL completo para criação das tabelas do sistema, seus relacionamentos (chaves estrangeiras) e registros iniciais de teste. O banco foi hospedado e testado na plataforma [InfinityFree](https://infinityfree.net/), utilizando o phpMyAdmin para gerenciamento.

## 🗂️ Estrutura do banco de dados

O banco é composto pelas seguintes tabelas:

| Tabela        | Descrição                                      |
|---------------|-------------------------------------------------|
| `categoria`   | Categorias dos produtos                         |
| `cliente`     | Dados cadastrais dos clientes                   |
| `fornecedor`  | Dados dos fornecedores                          |
| `marca`       | Marcas dos produtos                             |
| `produto`     | Produtos disponíveis, vinculados a marca        |
| `pedido`      | Pedidos realizados, vinculados a cliente e fornecedor |
| `itempedido`  | Itens de cada pedido, vinculados a produto       |

### Relacionamentos (Foreign Keys)

- `produto.id_marca` → `marca.id`
- `pedido.id_cliente` → `cliente.id`
- `pedido.id_fornecedor` → `fornecedor.id`
- `itempedido.id_pedido` → `pedido.id`
- `itempedido.id_produto` → `produto.id`

## 🚀 Como executar

1. Crie um banco de dados MySQL vazio.
2. Acesse o phpMyAdmin (ou outro cliente MySQL de sua preferência).
3. Selecione o banco criado e execute o conteúdo do arquivo [`schema/create_tables.sql`](schema/create_tables.sql).
4. O script irá remover as tabelas existentes (se houver), recriá-las na ordem correta e inserir os registros de teste.

> ⚠️ O script utiliza `DROP TABLE IF EXISTS`, ou seja, ao executá-lo os dados atuais dessas tabelas serão apagados antes da recriação.

## 🛠️ Tecnologias

- MySQL (InnoDB)
- phpMyAdmin
- Hospedagem: InfinityFree

## 📚 Aprendizado

Este projeto foi desenvolvido para aplicar na prática os conceitos de modelagem de banco de dados relacional, criação de tabelas, definição de chaves primárias e estrangeiras, e configuração de um banco de dados em um ambiente de hospedagem web real.
