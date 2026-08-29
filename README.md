# Repositorio Projeto Pequisa e Inovacao
Projeto de criação de um sistema utilizando um sensor de temperatura.

## Equipe

**Grupo 7 — São Paulo Tech School**

* Leonardo Vieira Linge – RA 01262109
* Manoel Alves da Silva Filho – RA 01262045
* Matheus de Souza Menino – RA 01262022
* Pietro Giuliani da Silva – RA 01262130
* Thayssa Santos Marques de Souza – RA 01262057
* Vitor Alexandre Osuna Arevalo – RA 01262052
* Vitor Hiroyuky Tsumura – RA 01262065

___

# Sistema de Monitoramento de Temperatura de Motores Elétricos

Sistema desenvolvido para o monitoramento da temperatura de motores elétricos utilizados em bombas centrífugas na indústria de tintas, utilizando Arduino e sensor de temperatura LM35.

O projeto foi desenvolvido como parte das atividades acadêmicas da São Paulo Tech School (SPTech).

---

## Sobre o Projeto

Motores elétricos utilizados em ambientes industriais estão sujeitos a condições que podem provocar aumento excessivo de temperatura. O superaquecimento pode indicar problemas no funcionamento do motor e, se não for identificado, pode resultar em falhas, paradas não planejadas, manutenção e prejuízos para a indústria.

Diante desse cenário, o projeto propõe um sistema capaz de monitorar continuamente a temperatura do motor, permitindo identificar situações de temperatura elevada e auxiliar na prevenção de possíveis falhas.

---

## Objetivo

Desenvolver um sistema de monitoramento capaz de:

* Medir a temperatura do motor em tempo real;
* Acompanhar as variações de temperatura;
* Alertar sobre possíveis condições de superaquecimento;
* Inserir os dados nas tabelas do Banco de Dados;
* Criar o site institucional do projeto;
* Criar dashboards que auxliem na visualização do desempenho do sistema;
* Auxiliar na manutenção preventiva dos motores.

---

## Tecnologias e Componentes

### Hardware

* Arduino
* Sensor de temperatura LM35
* Protoboard
* Jumpers
* Conector USB

### Software

* HTML e Javascript para a criação do Site Institucional;
* MySQL para criação das tabelas do Banco de Dados;
* Arduino IDE para a programação do Arduino;
* Git e GitHub para versionamento e armazenamento do projeto;
* Trello para organização do projeto;

---

## Funcionamento

O sistema utiliza o **LM35** para realizar a medição da temperatura do motor.

O sensor envia um sinal analógico ao Arduino, que realiza a leitura e conversão desse sinal para um valor correspondente à temperatura.

O funcionamento básico pode ser representado da seguinte forma:

```text
┌─────────────────┐
│  Motor Elétrico │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│      LM35       │
│ Sensor de Temp. │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│     Arduino     │
│ Processamento   │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Monitoramento   │
│ da Temperatura  │
└────────┬────────┘
         │
         ▼
    Temperatura
      elevada?
         │
    ┌────┴────┐
    │         │
   NÃO       SIM
    │         │
    ▼         ▼
 Normal     Alerta
```
> Observação: A gente coloca aqui a imagem do Diagrama de Visão de Negócio.
---

## Monitoramento

O sistema pode utilizar limites de temperatura para classificar o estado do motor.

| Estado     | Condição                                 |
| ---------- | ---------------------------------------- |
| 🟢 Normal  | Temperatura dentro do limite seguro      |
| 🟡 Atenção | Temperatura próxima ao limite            |
| 🔴 Crítico | Temperatura acima do limite estabelecido |


---

## Aplicação

O sistema foi pensado para aplicação em ambientes industriais, especialmente em motores responsáveis pelo acionamento de bombas centrífugas utilizadas na indústria de tintas.

O monitoramento da temperatura pode contribuir para a identificação antecipada de condições anormais de funcionamento, auxiliando na manutenção preventiva e na redução de possíveis paradas inesperadas.

---

## Projeto Acadêmico

Projeto desenvolvido para fins acadêmicos na **São Paulo Tech School (SPTech)**.

Tema:
Sistema de Monitoramento de Temperatura de Motores Elétricos Utilizados em Bombas Centrífugas da Indústria de Tintas.

---

## Licença

Este projeto foi desenvolvido para fins acadêmicos e educacionais.
