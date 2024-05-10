<?php

include 'conn.php';

//Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    //Retrieve data from POST request
    $data = array(
        'name' => $_POST['name'], // Replace 'name' with your actual column name
        'age' => $_POST['age'], 
        // Add more columns as needed
    );

    // Escape values to prevent SQL injection
    $escaped_data = array();
    foreach ($data as $key => $value) {
        $escaped_data[$key] = $conn->real_escape_string($value);
    }

    //Construct SQL query
    $columns = implode(", ", array_keys($escaped_data));
    $values = "'" . implode("', '", $escaped_data) . "'";
    $sql = "INSERT INTO tablename ($columns) VALUES ($values)";

    //Perform the insert query
    if ($conn->query($sql) === TRUE) {
        echo "New record inserted successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
} else {
    echo "Form submission method not allowed";
}
?>
