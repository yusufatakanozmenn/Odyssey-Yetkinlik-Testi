<?php
namespace App\Models;
use CodeIgniter\Model;
class WebinarModel extends Model
{
    protected $table = 'webinars'; 
    protected $primaryKey = 'id';
    protected $allowedFields = ['title', 'description', 'date', 'status', 'created_at'];

}
?>