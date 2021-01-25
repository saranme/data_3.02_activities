-- ACTIVITIES
Use bank;
/*
3.02 Activity 1
Keep working on the bank database.

Use the below query and list district_name, client_id and account_id for those clients who are owner of the account. 
Order the results by district_name:

select * from bank.disp d
join bank.client c
on d.client_id = c.client_id
join bank.district da
on da.A1 = c.district_id;
*/
SELECT c.client_id, d.account_id, da.A2 district_name
FROM disp d
JOIN client c
ON d.client_id = c.client_id
JOIN district da
ON da.A1 = c.district_id
WHERE type = 'OWNER'
ORDER BY 3;

/*
3.02 Activity 2
Keep working on the bank database.

List districts together with total amount borrowed and average loan amount.
*/
SELECT SUM(l.amount) total_loan_amount, round(AVG(l.amount),2) avg_loan_amount, d.A1 district_id, d.A2 district_name
FROM district d
JOIN account a
ON d.A1 = a.district_id
JOIN loan l
ON l.account_id = a.account_id
GROUP BY 3,4;

/*
3.02 Activity 3
Create a temporary table district_overview in the bank database which lists districts together with 
total amount borrowed and average loan amount.
*/
CREATE TEMPORARY TABLE district_overview
SELECT SUM(l.amount) total_loan_amount, round(AVG(l.amount),2) avg_loan_amount, d.A1 district_id, d.A2 district_name
FROM district d
JOIN account a
ON d.A1 = a.district_id
JOIN loan l
ON l.account_id = a.account_id
GROUP BY 3,4;

SELECT * FROM district_overview;

/*
3.02 Activity 4
Still working in the bank database, list the clients with no credit card.
*/

SELECT d.client_id client, card_id
FROM disp d
LEFT JOIN card c
ON d.disp_id = c.disp_id
WHERE card_id IS NULL


