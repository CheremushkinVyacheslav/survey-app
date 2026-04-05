<?php
require 'db.php';

$sql = "CREATE TABLE IF NOT EXISTS responses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  rating INT CHECK (rating BETWEEN 1 AND 5),
  comment TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)";

try {
  $pdo->exec($sql);
  echo "✅ Таблица успешно создана!";
} catch (PDOException $e) {
  echo "❌ Ошибка: " . $e->getMessage();
}