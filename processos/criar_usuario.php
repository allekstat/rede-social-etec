<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $usuario = $_POST['usuario'] ?? null;
    $senha = $_POST['senha'] ?? null;

    if (!$usuario || !$senha) {
        die("Usuário e senha são obrigatórios.");
    }
}
// Configurações do banco de dados
$host = 'https://deserto-arenoso.infinityfreeapp.com';
$dbname = 'redesocialetec';
$username = 'clienteweb';
$password = 'senhaclienteweb123';

try {
    // Conexão com o banco de dados
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Dados a serem inseridos
    $usuario = 'novo_usuario';
    $senha = password_hash('senha_segura', PASSWORD_DEFAULT); // Criptografar a senha

    // Query de inserção
    $sql = "INSERT INTO usuarios (usuario, senha) VALUES (:usuario, :senha)";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':usuario', $usuario);
    $stmt->bindParam(':senha', $senha);

    // Executar a query
    if ($stmt->execute()) {
        echo "Usuário inserido com sucesso!";
    } else {
        echo "Erro ao inserir usuário.";
    }
} catch (PDOException $e) {
    echo "Erro de conexão: " . $e->getMessage();
}
?>