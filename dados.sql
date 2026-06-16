TRUNCATE TABLE usuario, fornecedores, endereco, produtos, vendas, avaliacao, itens_venda RESTART IDENTITY CASCADE;

-- 1. Inserindo Clientes
INSERT INTO usuario (nome, email, senha) VALUES
('Alan Ferreira', 'alanzoka@email.com', 'hash_senha_123'),
('Alexandre Borba', 'gaules@email.com', 'hash_senha_123'),
('Ana Clara', 'aninha.gamer@email.com', 'hash_senha_123'),
('Carlos Eduardo', 'cadu.play@email.com', 'hash_senha_123'),
('Beatriz Souza', 'bia.games@email.com', 'hash_senha_123'),
('Daniel Costa', 'dan.dan@email.com', 'hash_senha_123'),
('Eduarda Lima', 'duda.pixel@email.com', 'hash_senha_123'),
('Felipe Rocha', 'felipinho.vrau@email.com', 'hash_senha_123'),
('Gabriela Nunes', 'gabi.retro@email.com', 'hash_senha_123'),
('Henrique Alves', 'hc.alves@email.com', 'hash_senha_123'),
('Isabela Mendes', 'isa.tomb@email.com', 'hash_senha_123'),
('João Pedro', 'jp.pro@email.com', 'hash_senha_123'),
('Karla Dias', 'karlinha@email.com', 'hash_senha_123'),
('Lucas Moraes', 'lucas.strike@email.com', 'hash_senha_123'),
('Mariana Castro', 'mari.mario@email.com', 'hash_senha_123');

-- 2. Inserindo Fornecedores (Publicadoras de Games)
INSERT INTO fornecedores (nome_razao_social, cnpj) VALUES
('Sony Interactive Entertainment', '11111111000111'),
('Nintendo Co., Ltd.', '22222222000122'),
('Xbox Game Studios', '33333333000133'),
('Capcom Co., Ltd.', '44444444000144'),
('Ubisoft Entertainment', '55555555000155'),
('Electronic Arts BR', '66666666000166'),
('Rockstar Games Inc.', '77777777000177'),
('Bandai Namco Entertainment', '88888888000188'),
('Square Enix Co.', '99999999000199'),
('Warner Bros. Games', '10101010000110'),
('Sega Corporation', '12121212000112'),
('Konami Digital Entertainment', '13131313000113'),
('CD Projekt Red', '14141414000114'),
('Activision Blizzard', '15151515000115'),
('Epic Games Inc.', '16161616000116');

-- 3. Inserindo Endereços
INSERT INTO endereco (numero, cep, cidade, estado, id_usuario) VALUES
('104', '01001000', 'São Paulo', 'SP', 1),
('200', '20040002', 'Rio de Janeiro', 'RJ', 2),
('35', '30140071', 'Belo Horizonte', 'MG', 3),
('100', '40010000', 'Salvador', 'BA', 4),
('55A', '80010000', 'Curitiba', 'PR', 5),
('123', '90010000', 'Porto Alegre', 'RS', 6),
('44', '70040010', 'Brasília', 'DF', 7),
('89', '60060000', 'Fortaleza', 'CE', 8),
('102', '50010000', 'Recife', 'PE', 9),
('77', '69010000', 'Manaus', 'AM', 10),
('500', '66010000', 'Belém', 'PA', 11),
('321', '74015010', 'Goiânia', 'GO', 12),
('12', '13010000', 'Campinas', 'SP', 13),
('98', '38400000', 'Uberlândia', 'MG', 14),
('15', '29010000', 'Vitória', 'ES', 15);

-- 4. Inserindo Produtos (Jogos)
INSERT INTO produtos (descricao, valor_unitario, quantidade_estoque, id_fornecedor) VALUES
('God of War Ragnarok (PS5)', 50.00, 5, 1),
('The Legend of Zelda: Tears of the Kingdom (Switch)', 45.00, 4, 2),
('Halo Infinite (Xbox Series X)', 30.00, 8, 3),
('Resident Evil 4 Remake (PS5)', 40.00, 6, 4),
('Assassin''s Creed Shadows (PS5)', 35.00, 5, 5),
('EA Sports FC 26 (PS5)', 55.00, 12, 6),
('GTA V (Xbox Series X)', 25.00, 10, 7),
('Elden Ring (PS5)', 60.00, 4, 8),
('Final Fantasy VII Rebirth (PS5)', 50.00, 3, 9),
('Mortal Kombat 1 (PS5)', 35.00, 7, 10),
('Sonic Frontiers (Switch)', 30.00, 6, 11),
('Silent Hill 2 Remake (PS5)', 45.00, 4, 12),
('Cyberpunk 2077 Ultimate Edition (PC)', 40.00, 5, 13),
('Call of Duty: Black Ops 6 (PS5)', 55.00, 8, 14),
('Alan Wake 2 (PC)', 45.00, 3, 15);

-- 5. Inserindo Vendas (Locações)
INSERT INTO vendas (data_venda, valor_total, id_usuario) VALUES
('2026-05-20 10:30:00', 50.00, 1),
('2026-05-20 11:15:00', 45.00, 2),
('2026-05-21 14:20:00', 30.00, 3),
('2026-05-21 16:45:00', 40.00, 4),
('2026-05-22 09:10:00', 35.00, 5),
('2026-05-22 13:00:00', 55.00, 6),
('2026-05-23 18:30:00', 25.00, 7),
('2026-05-23 20:00:00', 60.00, 8),
('2026-05-24 10:05:00', 50.00, 9),
('2026-05-24 12:40:00', 35.00, 10),
('2026-05-25 15:55:00', 30.00, 11),
('2026-05-25 17:20:00', 45.00, 12),
('2026-05-26 11:50:00', 40.00, 13),
('2026-05-26 14:10:00', 55.00, 14),
('2026-05-27 16:00:00', 45.00, 15);

-- 6. Inserindo Avaliações ("Reviews" dos Jogos)
INSERT INTO avaliacao (nota, descricao_comentario, data_publicacao, id_usuario, id_produto) VALUES
(5, 'Melhor história que já joguei, platinei com orgulho!', '2026-05-22', 1, 1),
(5, 'Mundo aberto impecável, a Nintendo não erra nunca.', '2026-05-23', 2, 2),
(4, 'Campanha muito boa, mas o multiplayer que brilha.', '2026-05-24', 3, 3),
(5, 'Nostalgia pura! O remake ficou perfeito e assustador.', '2026-05-25', 4, 4),
(3, 'Gráficos lindos no PS5, mas veio com alguns bugs chatos.', '2026-05-26', 5, 5),
(3, 'Mesma jogabilidade do ano passado, só mudou o elenco.', '2026-05-27', 6, 6),
(5, 'Jogo antigo mas continua sendo um clássico indispensável.', '2026-05-28', 7, 7),
(5, 'Morri 80 vezes pro primeiro boss, jogo do ano! Nota 10.', '2026-05-29', 8, 8),
(5, 'Sistema de combate excelente, ansioso pela parte 3.', '2026-05-30', 9, 9),
(4, 'Fatalities insanos, muito bom pra jogar de galera.', '2026-05-31', 10, 10),
(4, 'Divertido e rápido, mas o mundo aberto cansa um pouco.', '2026-06-01', 11, 11),
(5, 'Que atmosfera tensa, levei vários sustos jogando de madrugada.', '2026-06-01', 12, 12),
(5, 'Depois das atualizações o jogo virou uma obra-prima no PC.', '2026-06-01', 13, 13),
(4, 'O modo zombies está viciante demais nesse Call of Duty.', '2026-06-01', 14, 14),
(5, 'Terror psicológico de altíssimo nível, narrativa incrível.', '2026-06-01', 15, 15);

-- 7. Inserindo Itens das Vendas/Locações
INSERT INTO itens_venda (id_venda, id_produto, quantidade, valor_unitario_momento) VALUES
(1, 1, 1, 50.00),   
(2, 2, 1, 45.00),   
(3, 3, 1, 30.00),   
(4, 4, 1, 40.00),   
(5, 5, 1, 35.00),   
(6, 6, 1, 55.00),   
(7, 7, 1, 25.00),   
(8, 8, 1, 60.00),   
(9, 9, 1, 50.00),   
(10, 10, 1, 35.00), 
(11, 11, 1, 30.00), 
(12, 12, 1, 45.00), 
(13, 13, 1, 40.00), 
(14, 14, 1, 55.00), 
(15, 15, 1, 45.00);

