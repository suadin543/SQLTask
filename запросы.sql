-- Вывести менеджеров у которых имеется номер телефона
SELECT * FROM Managers WHERE phone IS NOT NULL;
-- Вывести кол-во продаж за 20 июня 2021
SELECT COUNT(*) AS sales_count FROM Sells WHERE date = '2021-06-20';
-- Вывести среднюю сумму продажи с товаром "Фанера"
SELECT AVG(sum) AS average_sale FROM Sells WHERE id_prod = (SELECT id FROM Products WHERE name = 'Фанера');
-- Вывести фамилии менеджеров и общую сумму продаж для каждого с товаром "ОСБ"
SELECT Managers.fio, SUM(Sells.sum) AS total_sales
FROM Managers
JOIN Sells ON Managers.id = Sells.id_manag
JOIN Products ON Sells.id_prod = Products.id
WHERE Products.name = 'ОСБ'
GROUP BY Managers.fio;
-- Вывести менеджера и товар, который продали 22 августа 2021
SELECT Managers.fio, Products.name AS sold_product
FROM Managers
JOIN Sells ON Managers.id = Sells.id_manag
JOIN Products ON Sells.id_prod = Products.id
WHERE Sells.date = '2021-08-22';
-- Вывести все товары, у которых в названии имеется "Фанера" и цена не ниже 1750
SELECT * FROM Products WHERE name LIKE '%Фанера%' AND cost >= 1750;
-- Вывести историю продаж товаров, группируя по месяцу продажи и наименованию товара
SELECT DATE_FORMAT(Sells.date, '%Y-%m') AS month, Products.name, SUM(Sells.count) AS total_sales
FROM Sells
JOIN Products ON Sells.id_prod = Products.id
GROUP BY month, Products.name;
-- Вывести количество повторяющихся значений и сами значения из таблицы "Товары", где количество повторений больше 1.
SELECT COUNT(*) AS povtor, name
FROM Products
GROUP BY name
HAVING COUNT(*) > 1;
