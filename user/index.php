<!DOCTYPE html>
<html lang="en">
<head>
<?php include('inc/head.php')?>
</head>

<body>
    <!-- ##### Header Area Start ##### -->
    <?php include('inc/header.php')?>
    <?php
    if (isset($_GET['msg'])) {
    ?>
<div class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
    <script>
        swal({
            title: 'Đăng nhập thành công!',
            icon: 'success',
            timer: 3000,
            buttons: true,
            type: 'success'
        })
    </script>
</div>
    <?php } ?>
    <!-- ##### Popular News Area Start ##### -->
    <div class="popular-news-area section-padding-80-50">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-12">
                    <div class="section-heading">
                        <h6>Tin tức mới nhất</h6>
                    </div>

                    <div class="row">
                        <?php 
                            $tintuc = "SELECT a.*, b.ten 
                            FROM tintuc as a, chude as b
                            WHERE a.chude_id = b.id
                            ORDER BY a.id DESC
                            LIMIT 9";
                            $resultbd = mysqli_query($connect, $tintuc);
                            while ($bd = mysqli_fetch_array($resultbd, MYSQLI_ASSOC)) {
                            ?>
                        <!-- Single Post -->
                        <div class="col-12 col-md-4">
                            <div class="single-blog-post style-3">
                                <div class="post-thumb">
                                    <a href="chitiet.php?id=<?php echo $bd['id'] ?>"><img style="width: 100%;height: 250px;" src="../admin/image/<?php echo $bd['anh'] ?>" alt=""></a>
                                </div>
                                <div class="post-data">
                                    <a href="chude.php?id=<?php echo $bd['chude_id'] ?>" class="post-catagory"><?php echo $bd['ten'] ?></a>
                                    <a href="chitiet.php?id=<?php echo $bd['id'] ?>" class="post-title">
                                        <h6><?php echo $bd['tieude'] ?></h6>
                                    </a>
                                    <div class="post-meta d-flex align-items-center">
                                        <a href="#" class="post-comment"><img style="margin-left : -20px !important" src="img/core-img/chat.png" alt=""> <span><?php echo $bd['ngay'] ?></span></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Popular News Area End ##### -->
    <!-- ##### Editorial Post Area End ##### -->

    <!-- ##### Footer Add Area Start ##### -->
    <?php include('inc/footer.php')?>
    <!-- ##### Footer Area Start ##### -->

    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
</body>

</html>