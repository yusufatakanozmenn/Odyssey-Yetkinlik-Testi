<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\Database\Exceptions\DatabaseException;
use Exception;

class Webinars extends ResourceController
{
    protected $modelName = 'App\Models\WebinarModel';
    protected $format    = 'json';

    public function index()
    {
        // API anahtarını doğrulama
        $apiKey = $this->request->getGet('api_key');
        $validApiKey = getenv('API_KEY'); // .env dosyasındaki anahtar
    
        if ($validApiKey === false) {
            return $this->failServerError(json_encode([
                'status' => 500,
                'error' => 'API anahtarı yüklenemedi.',
                'messages' => [
                    'error' => 'API anahtarını yüklerken bir hata oluştu.'
                ]
            ], JSON_UNESCAPED_UNICODE));
        }
    
        if ($apiKey !== $validApiKey) {
            return $this->failUnauthorized(json_encode([
                'status' => 401,
                'error' => 'Yetkisiz erişim.',
                'messages' => [
                    'error' => 'Geçersiz API anahtarı.'
                ]
            ], JSON_UNESCAPED_UNICODE));
        }
    
        try {
            // URL üzerinden gelen status parametresini al
            $status = $this->request->getGet('status');
    
            // Eğer body üzerinden gelen JSON verisi varsa, onu kontrol et
            if ($this->request->getMethod() === 'post' || $this->request->getMethod() === 'put') {
                $jsonBody = $this->request->getJSON();
                if (isset($jsonBody->status)) {
                    $status = $jsonBody->status;
                }
            }
    
            // Veritabanından veri çek
            $webinars = $this->fetchWebinars($status);
    
            // JSON formatında yanıtı döndür
            return $this->respond($webinars);
        } catch (DatabaseException $e) {
            // Veritabanı bağlantı hatası durumunda JSON formatında hata mesajı döndür
            return $this->failServerError(json_encode([
                'status' => 500,
                'error' => 'Veritabanı bağlantı hatası.',
                'messages' => [
                    'error' => 'Veritabanına bağlanırken bir hata oluştu. Lütfen veritabanı ayarlarını kontrol edin.'
                ]
            ], JSON_UNESCAPED_UNICODE));
        } catch (Exception $e) {
            // Diğer hatalar için de JSON formatında hata mesajı döndür
            return $this->failServerError(json_encode([
                'status' => 500,
                'error' => 'Bir hata oluştu.',
                'messages' => [
                    'error' => 'Bir hata meydana geldi. Lütfen daha sonra tekrar deneyin.'
                ]
            ], JSON_UNESCAPED_UNICODE));
        }
    }

    private function fetchWebinars($status = null)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('webinars');
    
        // Eğer status parametresi varsa ona göre filtre uygula
        if ($status !== null) {
            // Status değerinin sadece 0 veya 1 olabileceğini kontrol et
            if (!in_array((int)$status, [0, 1])) {
                throw new Exception('Geçersiz status değeri.');
            }
            $builder->where('status', (int)$status);
        }
    
        // Verileri çek ve döndür
        return $builder->get()->getResult();
    }
}
