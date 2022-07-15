CREATE VIEW cardholder_transactions AS
SELECT h.id, h.name, c.card, t.date, round(t.amount, 2) AS "amount", m.name AS "merchant", g.name AS "category" 
FROM card_holder h
    LEFT JOIN credit_card c
    ON h.id = c.cardholder_id
        LEFT JOIN transaction t
        ON c.card = t.card
            RIGHT JOIN merchant m
            ON t.id_merchant = m.id
                Right JOIN merchant_category g
                ON m.id_merchant_category = g.id
GROUP BY h.id, h.name, c.card, t.date, t.amount, m.name, g.name
ORDER BY h.id;


CREATE VIEW cardholder_transaction AS
SELECT h.id, h.name, c.card, t.date, round(t.amount, 2) AS "amount", m.name AS "merchant", g.name AS "category" 
FROM card_holder h
    LEFT JOIN credit_card c
    ON h.id = c.cardholder_id
        LEFT JOIN transaction t
        ON c.card = t.card
            RIGHT JOIN merchant m
            ON t.id_merchant = m.id
                Right JOIN merchant_category g
                ON m.id_merchant_category = g.id
GROUP BY h.id, h.name, c.card, t.date, t.amount, m.name, g.name
ORDER BY round(t.amount, 2) DESC;


CREATE VIEW transaction_time AS
SELECT * 
FROM cardholder_transaction 
    WHERE date::time between time '07:00:00' and '09:00:00';
    

CREATE VIEW top_100_7to9 AS
SELECT * 
FROM cardholder_transaction 
    WHERE date::time between time '07:00:00' and '09:00:00'
    LIMIT 100;
    

CREATE VIEW less_than_2 AS
SELECT * 
FROM cardholder_transactions 
    WHERE amount <= 2.00;


CREATE VIEW small_transactions AS
SELECT s.id, s.name, COUNT(s.id) AS "small_transactions" 
FROM less_than_2 s
GROUP BY s.id, s.name
ORDER BY "small_transactions" DESC;


CREATE VIEW vulnerable_merchants AS
SELECT s.merchant, s.category, COUNT(s.merchant) AS "vulnerable_merchant"
FROM less_than_2 s
GROUP BY s.merchant, s.category
ORDER BY "vulnerable_merchant" DESC;