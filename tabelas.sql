DROP TABLE IF EXISTS itens_venda CASCADE;
DROP TABLE IF EXISTS avaliacao CASCADE;
DROP TABLE IF EXISTS vendas CASCADE;
DROP TABLE IF EXISTS produtos CASCADE;
DROP TABLE IF EXISTS endereco CASCADE;
DROP TABLE IF EXISTS fornecedores CASCADE;
DROP TABLE IF EXISTS usuario CASCADE;

-- =========================================================================
-- CRIAÇÃO DAS TABELAS INDEPENDENTES
-- =========================================================================
CREATE TABLE usuario (
    id_usuario INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE fornecedores (
    id_fornecedor INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_razao_social VARCHAR(100) NOT NULL,
    cnpj VARCHAR(14) NOT NULL UNIQUE
);

-- =========================================================================
-- CRIAÇÃO DAS TABELAS DEPENDENTES
-- =========================================================================
CREATE TABLE endereco (
    id_endereco INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    numero VARCHAR(10) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    id_usuario INT NOT NULL,
    CONSTRAINT fk_endereco_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE produtos (
    id_produto INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    id_fornecedor INT NOT NULL,
    CONSTRAINT fk_produto_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);

CREATE TABLE vendas (
    id_venda INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    data_venda TIMESTAMP NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    id_usuario INT NOT NULL,
    CONSTRAINT fk_venda_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- =========================================================================
-- CRIAÇÃO DAS TABELAS DE RELACIONAMENTO / CRUZAMENTO N:N
-- =========================================================================
CREATE TABLE avaliacao (
    id_avaliacao INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nota INT NOT NULL CHECK (nota >= 0 AND nota <= 5),
    descricao_comentario TEXT,
    data_publicacao DATE NOT NULL,
    id_usuario INT NOT NULL,
    id_produto INT NOT NULL,
    CONSTRAINT fk_avaliacao_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    CONSTRAINT fk_avaliacao_produto FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE itens_venda (
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario_momento DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_venda, id_produto), 
    CONSTRAINT fk_itens_venda FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    CONSTRAINT fk_itens_produto FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
