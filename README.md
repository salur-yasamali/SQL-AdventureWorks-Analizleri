# 🚴 AdventureWorks Satış ve Müşteri Analizi Projesi

Bu proje, büyük ölçekli kurumsal bir veritabanı senaryosu olan **AdventureWorks** üzerinde gerçekleştirilen kapsamlı bir SQL veri analizi çalışmasıdır. 

Amaç; ham satış, müşteri ve insan kaynakları verilerini işleyerek stratejik karar alma süreçlerini destekleyecek **anlamlı içgörüler (insights)** elde etmektir.

---

## 🛠️ Kullanılan Teknolojiler ve Yetkinlikler

![SQL](https://img.shields.io/badge/Language-SQL-blue?style=for-the-badge&logo=microsoft-sql-server)
![SSMS](https://img.shields.io/badge/Tool-SSMS-red?style=for-the-badge&logo=microsoft-sql-server)

Bu projede **Microsoft SQL Server (T-SQL)** kullanılarak aşağıdaki teknik konularda ileri seviye sorgular yazılmıştır:

* **Veri Birleştirme:** Çoklu tabloların (`JOINs`) birleştirilmesiyle ilişkisel veri analizi.
* **Segmentasyon:** `CASE WHEN` yapıları ile dinamik müşteri ve ürün segmentasyonu.
* **İleri Seviye Filtreleme:** `GROUP BY`, `HAVING` ve `Subqueries` (Alt Sorgular) ile performans metriklerinin hesaplanması.
* **Veri Bütünlüğü:** `NULL` değerlerin yönetimi ve veri temizliği senaryoları.

---

## 📊 Örnek İş Senaryoları (Business Problems Solved)

Bu repodaki `.sql` dosyasında (AdventureWorks_Portföy_Sorguları.sql) aşağıdaki iş problemlerine çözümler üretilmiştir:

1.  **Müşteri Sadakati Analizi:** Belirli bir yılda ortalama üzeri sipariş veren müşterilerin tespit edilmesi.
2.  **Pazar Segmentasyonu:** Müşterilerin ve ürünlerin fiyat/performans kriterlerine göre "Premium" veya "Ekonomik" olarak etiketlenmesi.
3.  **Pasif Müşteri Tespiti:** Sisteme kayıtlı olup hiç sipariş vermemiş müşterilerin (Leads) belirlenmesi (`LEFT JOIN` analizi).
4.  **Organizasyonel Analiz:** 4 farklı tablo birleştirilerek departman bazlı çalışan raporlaması.

---

## 🚀 Projeyi İncelemek İçin

Detaylı SQL kodlarını ve açıklamaları incelemek için lütfen yukarıdaki **[AdventureWorks_Portfolio_Queries.sql](AdventureWorks_Portfolio_Queries.sql)** dosyasına tıklayınız. Her sorgunun başında amacı ve kullanılan teknik detaylıca açıklanmıştır.

---
*Bu proje, Veri Analisti olma yolculuğumun bir parçası olarak sürekli geliştirilmektedir.*
