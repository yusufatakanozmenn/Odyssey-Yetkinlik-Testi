# Webinars API

Bu proje, CodeIgniter kullanarak basit bir RESTful API geliştirme örneğidir. API, bir MySQL veritabanındaki `webinars` tablosundan verileri JSON formatında döndürmektedir.

## Özellikler

- API anahtarı ile erişim kontrolü.
- `status` parametresi ile aktif (1) veya pasif (0) webinarları filtreleme.
- Hata yönetimi ile kullanıcı dostu hata mesajları.
- URL ve JSON body üzerinden istek kabul etme.

## Gereksinimler

- PHP 7.2 veya üzeri
- CodeIgniter 4
- MySQL

## Kurulum

1. **Veritabanı Ayarları**
   - MySQL veritabanında `webinars` isimli bir tablo oluşturun. Tablo, aşağıdaki sütunları içermelidir:
     - `id` (int, auto_increment, primary key)
     - `title` (varchar)
     - `description` (text)
     - `date` (datetime)
     - `status` (tinyint)
     - `created_at` (timestamp)

   - Örnek SQL sorgusu:
     ```sql
     CREATE TABLE webinars (
         id INT AUTO_INCREMENT PRIMARY KEY,
         title VARCHAR(255) NOT NULL,
         description TEXT,
         date DATETIME NOT NULL,
         status TINYINT(1) NOT NULL,
         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
     );

     INSERT INTO webinars (title, description, date, status) VALUES 
     ('Webinar 1', 'Description for Webinar 1', '2024-11-01 10:00:00', 1),
     ('Webinar 2', 'Description for Webinar 2', '2024-11-02 11:00:00', 0);
     ```

2. **API Anahtarını Ayarlama**
   - Projeye `.env` dosyası ekleyin ve aşağıdaki satırı ekleyin:
     ```plaintext
     API_KEY=my_secret_api_key
     ```

3. **Proje Yapılandırması**
   - Gerekli bağımlılıkları yükleyin:
     ```bash
     composer install
     ```

4. **API'yi Çalıştırma**
   - Web sunucunuzu başlatın (örneğin, Apache veya Nginx) ve projenize gidin.

## Kullanım

API'ye istek göndermek için aşağıdaki örnekleri kullanabilirsiniz:

- **GET İsteği (URL üzerinden)**:
http://localhost/odyssey/public/webinars?api_key=my_api_key&status=1

http://localhost/odyssey/public/webinars?api_key=my_api_key&status=0