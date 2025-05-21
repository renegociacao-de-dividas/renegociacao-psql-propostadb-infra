-- Criação da tabela de clientes (caso necessário relacionamento)
CREATE TABLE IF NOT EXISTS clientes (
    id UUID PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    data_nascimento DATE,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de propostas
CREATE TABLE IF NOT EXISTS propostas (
    id UUID PRIMARY KEY,
    cliente_id UUID NOT NULL,
    valor NUMERIC(12, 2) NOT NULL,
    prazo_meses INTEGER NOT NULL,
    taxa_juros NUMERIC(5, 2),
    status VARCHAR(20) NOT NULL DEFAULT 'PENDENTE',
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Criação da tabela de eventos da proposta (histórico de status, logs, etc)
CREATE TABLE IF NOT EXISTS proposta_eventos (
    id UUID PRIMARY KEY,
    proposta_id UUID NOT NULL,
    tipo_evento VARCHAR(100) NOT NULL,
    descricao TEXT,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (proposta_id) REFERENCES propostas(id)
);
