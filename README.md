# 📊 Análise de E-commerce com SQL (Base Olist)

Projeto de análise de dados utilizando SQL com a base pública da Olist, explorando comportamento de clientes, vendas, logística e satisfação.

---

## 🎯 Objetivo

Construir uma base analítica e responder perguntas de negócio como:

* Quais pedidos foram entregues com atraso?
* Quantos clientes são recorrentes?
* Qual o faturamento por estado?
* Como a avaliação do cliente varia por status do pedido?
* Qual a categoria mais vendida?
* Qual o frete médio por categoria?

---

## 🛠️ Ferramentas utilizadas

* SQL (SQLite Online)
* GitHub

---

## 📁 Estrutura do projeto

* `analise_olist.sql` → consultas SQL com todas as análises
* `README.md` → descrição do projeto

---

## 📊 Principais análises

### 🚚 Atraso na entrega

Identificação de pedidos onde a data real de entrega foi maior que a data estimada.

### 🔁 Clientes recorrentes

Uso do `customer_unique_id` para identificar clientes com mais de uma compra.

### 💰 Faturamento por estado

Análise do valor total de pagamentos agrupados por estado do cliente.

### ⭐ Avaliação por status do pedido

Cálculo da média de `review_score` por status (delivered, canceled, etc.).

### 🛒 Categoria mais vendida

Identificação das categorias com maior volume de vendas.

### 📦 Frete médio por categoria

Comparação do custo médio de frete entre categorias de produtos.

---

## 🧠 Base Analítica

Foi criada uma tabela analítica contendo:

* ID do pedido
* Estado do cliente
* Data da compra
* Valor total dos itens
* Frete total
* Quantidade de itens
* Avaliação do cliente

Essa base permite análises mais avançadas e construção de dashboards.

---

## 🚀 Possíveis próximos passos

* Criar dashboard no Power BI ou Tableau
* Analisar relação entre atraso e avaliação
* Identificar categorias com maior ticket médio
* Estudar comportamento de clientes recorrentes

---

## 💡 Sobre mim

Sou formada em Gestão de RH e atualmente estou em transição de carreira para a área de Dados, estudando Ciência de Dados.

Este projeto faz parte da minha prática em SQL e análise de dados.

---

✨ Obrigada por visitar meu projeto!
