<?php
session_start();

// Database connection
$servername = "localhost"; // Change if your server name is different
$username = "root";        // Your database username
$password = "mAjimaji21!!";            // Your database password
$dbname = "laundry"; // Your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $inputUsername = $_POST['username'];
    $inputPassword = $_POST['password'];

    $stmt = $conn->prepare("SELECT * FROM user WHERE username = ?");
    $stmt->bind_param("s", $inputUsername);

    if ($stmt->execute()) {
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $storedPassword = $row['user_password'];

            if (password_verify($inputPassword, $storedPassword)) {
                // Login successful, store user information in session and redirect to home page
                $_SESSION['user_id'] = $row['id'];
                $_SESSION['username'] = $row['username'];
                header("Location: ../home.php");
                exit();
            } else {
                // Invalid password
                $error = "Invalid username or password.";
            }
        } else {
            // Invalid username
            $error = "Invalid username or password.";
        }
    } else {
        $error = "Error executing the query: " . $stmt->error;
    }
    $stmt->close();
}

$conn->close();
?>


<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Login Form</title>
  <link rel="stylesheet" href="assets/css/style.css">
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body>
  <section class="container">
    <div class="login">
      <h1>Login to Laundry Shop</h1>
      <form method="post" id="form-login">
        <p><input autofocus type="text" name="username" id="username" value="" placeholder="Username" required></p>
        <p><input type="password" name="password" id="password" value="" placeholder="Password" required></p>
        <p class="remember_me">
          <label>
            <input type="checkbox" name="remember_me" id="remember_me">
            Remember me on this computer
          </label>
        </p>
        <p class="submit"><input type="submit" name="commit" value="Login"></p>
      </form>
    </div>

    <div class="login-help">
      <p>Forgot your password? <a href="index.php">Click here to reset it</a>.</p>
      <p>Don't have an account? <a href="./data/register.php">Register here</a>.</p>
    </div>
  </section>

  <script src="assets/js/jquery-3.1.1.min.js"></script> 
  <script src="assets/js/bootstrap.min.js"></script>
  <script src="assets/js/login.js"></script>
</body>
</html>
