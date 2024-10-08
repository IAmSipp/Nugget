<?php
session_start();
require_once '../database/db.php';

if (!isset($_GET['id'])) {
    header('Location: ../index.php');
    exit();
}

$post_id = $_GET['id'];

// FETCH THE POST TO EDIT
$post_query = "SELECT * FROM contents WHERE id = ? AND owner_id = ?";
$stmt = $conn->prepare($post_query);
$stmt->bind_param("ii", $post_id, $_SESSION['user_id']);
$stmt->execute();
$post = $stmt->get_result()->fetch_assoc();

if (!$post) {
    $_SESSION['error_message'] = "You are not authorized to edit this post.";
    header('Location: index.php');
    exit();
}

// HANDLE THE POST UPDATE
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['edit_post'])) {
    $image = $post['image']; // KEEP THE EXISTING IMAGE BY DEFAULT

    // HANDLE NEW IMAGE UPLOAD
    if (isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
        $image_name = time() . '_' . $_FILES['image']['name'];
        $image_path = '../uploads/' . $image_name;
        if (move_uploaded_file($_FILES['image']['tmp_name'], $image_path)) {
            $image = $image_path; // UPDATE WITH THE NEW IMAGE PATH
        }
    }

    $update_query = "UPDATE contents SET image = ? WHERE id = ?";
    $stmt = $conn->prepare($update_query);
    $stmt->bind_param("si", $image, $post_id);

    if ($stmt->execute()) {
        $_SESSION['success_message'] = "Post updated successfully!";
    } else {
        $_SESSION['error_message'] = "Error: " . $stmt->error;
    }

    header('Location: ../index.php');
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Post</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-dark text-light">
    <div class="container mt-5">
        <h2>Edit Post</h2>

        <!-- Display success or error messages -->
        <?php if (isset($_SESSION['success_message'])): ?>
            <div class="alert alert-success" role="alert">
                <?php echo $_SESSION['success_message'];
                unset($_SESSION['success_message']); ?>
            </div>
        <?php endif; ?>

        <?php if (isset($_SESSION['error_message'])): ?>
            <div class="alert alert-danger" role="alert">
                <?php echo $_SESSION['error_message'];
                unset($_SESSION['error_message']); ?>
            </div>
        <?php endif; ?>

        <form action="edit_post.php?id=<?php echo $post_id; ?>" method="POST" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="image" class="form-label">Upload New Image</label>
                <input type="file" name="image" id="image" class="form-control" required>
                <?php if ($post['image']): ?>
                    <div class="mt-2">
                        <img src="<?php echo htmlspecialchars($post['image']); ?>" alt="Current Post Image" class="img-fluid" style="max-width: 100%;">
                    </div>
                <?php endif; ?>
            </div>
            <button type="submit" name="edit_post" class="btn btn-primary">Save Changes</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>