/* Amaç: Dağınık veritabanında (4 Tablo) spesifik bir çalışan grubunu bulmak.
   Teknik: Person -> Employee -> DepartmentHistory -> Department zincirini kurmak.
*/

SELECT DISTINCT 
    t1.FirstName,
    t1.LastName 
FROM 
    Person.Person AS t1
INNER JOIN 
    HumanResources.Employee AS t2 ON t1.BusinessEntityID = t2.BusinessEntityID
INNER JOIN 
    HumanResources.EmployeeDepartmentHistory AS t3 ON t2.BusinessEntityID = t3.BusinessEntityID
INNER JOIN 
    HumanResources.Department AS t4 ON t3.DepartmentID = t4.DepartmentID 
WHERE 
    t4.Name = 'Marketing' 
    AND t1.LastName LIKE 'S%';




/* Amaç: Belirli bir yılda yüksek aktivite gösteren müşterileri segmente etmek.
   Teknik: Veriyi önce filtreleyip (WHERE), sonra gruplayıp (GROUP BY), en son grup sonucunu filtreleme (HAVING).
*/

SELECT 
    CustomerID,
    COUNT(*) AS Toplam_Siparis 
FROM 
    Sales.SalesOrderHeader
WHERE 
    YEAR(OrderDate) = 2011
GROUP BY 
    CustomerID 
HAVING 
    COUNT(*) > 2;




/* Amaç: Dinamik bir eşik değere (Ortalama Fiyat) göre ürünleri filtrelemek.
   Teknik: Ana sorgunun içinde çalışan bir 'Yardımcı Sorgu' (Subquery) ile ortalamayı bulma.
*/

SELECT 
    Name,
    ListPrice 
FROM 
    Production.Product
WHERE 
    ListPrice > (
        -- Yardımcı Sorgu: Dağ Bisikletlerinin ortalama fiyatını hesaplar
        SELECT AVG(T1.ListPrice) 
        FROM Production.Product AS T1 
        INNER JOIN Production.ProductSubcategory AS T2 ON T1.ProductSubcategoryID = T2.ProductSubcategoryID 
        WHERE T2.Name = 'Mountain Bikes'
    ); 




/* Amaç: Sisteme kayıtlı olup hiç işlem yapmayan 'Pasif Müşterileri' bulmak.
   Teknik: LEFT JOIN ile tüm müşterileri getirip, sağ tabloda (Siparişler) karşılığı olmayanları (NULL) yakalamak.
*/

SELECT 
    t1.FirstName,
    t1.LastName,
    t2.CustomerID 
FROM 
    Person.Person AS t1
LEFT JOIN 
    Sales.Customer AS t2 on t1.BusinessEntityID = t2.PersonID
LEFT JOIN 
    Sales.SalesOrderHeader AS t3 ON t2.CustomerID= t3.CustomerID 
WHERE 
    t1.FirstName LIKE 'A%' -- (Opsiyonel: İsmi A ile başlayanlar)
    AND t3.SalesOrderID IS NULL; -- Kritik Nokta: Sipariş ID'si olmayanlar




/* Amaç: Ham veriyi iş kurallarına göre anlamlı segmentlere ayırmak (Etiketleme).
   Teknik: CASE yapısını hem SELECT hem de GROUP BY içinde kullanarak dinamik gruplama.
*/

SELECT 
    COUNT(*) AS Adet,
    CASE 
        WHEN ListPrice = 0 THEN 'Promosyon/Numune'
        WHEN ListPrice < 1000 THEN 'Ekonomik'
        ELSE 'Premium'
    END AS Fiyat_Segmenti
FROM 
    Production.Product
GROUP BY 
    CASE 
        WHEN ListPrice = 0 THEN 'Promosyon/Numune'
        WHEN ListPrice < 1000 THEN 'Ekonomik'
        ELSE 'Premium'
    END;