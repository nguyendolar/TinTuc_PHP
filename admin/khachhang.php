<!DOCTYPE html>
<html lang="en">

<head>
<?php include('inc/head.php')?>
</head>

<body class="sb-nav-fixed">
<?php include('inc/header.php')?>
    <div id="layoutSidenav">
    <?php include('inc/menu.php')?>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Danh sách khách hàng</h1>
                    <div class="card mb-4">
                        <div class="card-header">
                        <?php if (isset($_GET['msg'])){
                            if($_GET['msg'] == 1){ ?>
                             <div class="alert alert-success">
                                <strong>Thành công</strong>
                            </div>
                            <?php }  ?> 
                            <?php }  ?>   
                            <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                data-bs-target="#exampleModalAdd">
                                Thêm mới
                            </button>
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                <tr style="background-color : #6D6D6D">
                                        <th>STT</th>
                                        <th>Khách hàng</th>
                                        <th>Số điện thoại</th>
                                        <th>Email</th>
                                        <th>Dịch vụ</th>
                                        <th>Tình trạng dịch vụ</th>
                                        <!-- <th>Tổng tiền</th>
                                        <th>Tình trạng thanh toán</th> -->
                                        <th>Ngày thuê</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php 
                                $idad = $_SESSION['id'];
                                if($_SESSION['capdo'] == 1){
                                    $query = "SELECT a.* FROM khachhang as a
                                    ORDER BY a.ngaythue DESC";
                                }else{
                                    $query = "SELECT a.* FROM khachhang as a
                                    WHERE a.admin_id = $idad
                                    ORDER BY a.ngaythue DESC";
                                }
                                    
                                    $result = mysqli_query($connect, $query);
                                    $stt = 1;
                                    while ($arUser = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                        $idModelDel = "exampleModalDel".$arUser["id"] ;
                                        $idModelDes = "exampleModalDes".$arUser["id"] ;
                                        $idModelEdit = "exampleModalEdit".$arUser["id"];
                                        $khid = $arUser["id"];
                                        $khdv = "SELECT * FROM khachhangdichvu
                                        WHERE khachhang_id = $khid";
                                        $rkhdv = mysqli_query($connect, $khdv);
                                        $mang = []; 
                                        while ($akhdvid = mysqli_fetch_array($rkhdv, MYSQLI_ASSOC)) {
                                            $mang[] = $akhdvid['dichvu_id'];
                                        }
                                    ?>
                                    <tr>
                                        <td><?php echo $stt ?></td>
                                        <td><?php echo $arUser["hoten"] ?></td>
                                        <td><?php echo $arUser["sodienthoai"] ?></td>
                                        <td><?php echo $arUser["email"] ?></td>
                                        <td style="width : 330px !important">
                                            <ul>
                                            <?php
                                            $qrkhdv = "SELECT a.*,b.tieude FROM khachhangdichvu as a,baidang as b
                                            WHERE a.dichvu_id = b.id
                                            AND a.khachhang_id = $khid";
                                            $resultkhdv = mysqli_query($connect, $qrkhdv);
                                            while ($arkhdv = mysqli_fetch_array($resultkhdv, MYSQLI_ASSOC)) {
                                            ?>
                                            <li><a target="_blank" href="/i-map/user/chitiet.php?id=<?php echo $arkhdv["dichvu_id"] ?>"><?php echo $arkhdv["tieude"] ?></a></li>
                                            <?php } ?>
                                            </ul>
                                        </td>
                                        <td><?php echo $arUser["tinhtrangdichvu"] ?></td>
          
                                        <td><?php echo $arUser["ngaythue"]; ?></td>
                                        <td style="width : 130px !important">
                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                data-bs-target="#<?php echo $idModelEdit ?>">
                                                Sửa
                                            </button>
                                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                                data-bs-target="#<?php echo $idModelDel ?>">
                                                Xóa
                                            </button>
                                            <!--Dele-->
                                            <div class="modal fade" id="<?php echo $idModelDel ?>" tabindex="-1"
                                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Bạn chắc chắn muốn xóa ?</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                    aria-label="Close"></button>
                                                        </div>

                                                        <div class="modal-body">
                                                            Khách hàng : <?php echo $arUser["hoten"] ?>
                                                            <form action="function.php" method="post">
                                                                <input type="hidden" class="form-control" id="id" name="id" value="<?php echo $arUser["id"] ?>">
                                                                <div class="modal-footer" style="margin-top: 20px">
                                                                    <button style="width:100px" type="button" class="btn btn-secondary"
                                                                            data-bs-dismiss="modal">
                                                                        Đóng
                                                                    </button>
                                                                    <button style="width:100px" type="submit" class="btn btn-danger" name="deletekh"> Xóa</button>

                                                                </div>

                                                            </form>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <!--Dele-->
                                        </td>

                                    </tr>
                                    <!-- Modal Update-->
                                    <div class="modal fade" id="<?php echo $idModelEdit ?>" tabindex="-1"
                                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-xl">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Cập nhập</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="function.php" method="POST" enctype="multipart/form-data">
                                                        <input type="hidden" class="form-control" id="id" name="id" value="<?php echo $arUser["id"] ?>">
                                                        <div class="col">
                                                        <div class="row">
                                                        <div class="col-6">
                                                            <label for="category-film"
                                                                class="col-form-label">Họ tên khách hàng:</label>
                                                                <input type="text" class="form-control" id="category-film" value="<?php echo $arUser["hoten"] ?>" name="hoten" required>
                                                        </div>
                                                        <div class="col-6">
                                                            <label for="category-film"
                                                                class="col-form-label">Số điện thoại:</label>
                                                                <input type="number" class="form-control" id="category-film" value="<?php echo $arUser["sodienthoai"] ?>" name="sodienthoai" required>
                                                        </div>
                                                        </div>
                                                        <div class="row">
                                                        <div class="col-6">
                                                            <label for="category-film"
                                                                class="col-form-label">Email:</label>
                                                                <input type="email" class="form-control" id="category-film" value="<?php echo $arUser["email"] ?>" name="email" required>
                                                        </div>
                                                        <div class="col-6">
                                                            <label for="category-film"
                                                                class="col-form-label">Tình trạng dịch vụ:</label>
                                                                <input type="text" class="form-control" id="category-film" value="<?php echo $arUser["tinhtrangdichvu"] ?>" name="tinhtrangdichvu" required>
                                                        </div>
                                                        </div>
                                                        <div class="row">
                                                        <div class="col-12">
                                                            <label for="category-film"
                                                                class="col-form-label">Dịch vụ:</label>
                                                                <select class="form-select" aria-label="Default select example" id="theloai" tabindex="8" name="dichvu[]" multiple="multiple" required>
                                                                    <?php
                                                                     $dvU = mysqli_query($connect, "SELECT a.*, b.tenloaibaidang 
                                                                     FROM baidang as a, loaibaidang as b
                                                                     WHERE a.loaibaidang_id = b.id
                                                                     AND a.loaibaidang_id IN
                                                                     (SELECT id FROM loaibaidang
                                                                     WHERE demuc = 'Dịch Vụ')");
                                                                     while ($arDvU = mysqli_fetch_array($dvU, MYSQLI_ASSOC)) {
                                                                        $s = 0;
                                                                        foreach ($mang as $a){
                                                                            if($a == $arDvU['id']){ 
                                                                                $s++;
                                                                         }
                                                                        }
                                                                        if($s > 0){ ?>
                                                                            <option selected value="<?php echo $arDvU['id']; ?>" ><?php echo $arDvU['tieude']; ?> - ( <?php echo $arDvU['tenloaibaidang']; ?>)</option>
                                                                        <?php } else {?>
                                                                            <option value="<?php echo $arDvU['id']; ?>" ><?php echo $arDvU['tieude']; ?> - ( <?php echo $arDvU['tenloaibaidang']; ?>)</option>
                                                                            <?php   }
                                                                    ?>
                                                                    
                                                                    <?php } ?>
                                                                </select>
                                                        </div>
                                                        </div>
                                                    </div>
                                                        <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                        data-bs-dismiss="modal">Đóng</button>
                                                    <button type="submit" class="btn btn-primary" name="editkh">Lưu</button>
                                                </div>
                                                    </form>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Modal Update-->
                                    <?php $stt++;} ?>
                                    <!-- Modal Add-->
                                    <div class="modal fade" id="exampleModalAdd" tabindex="-1"
                                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-xl">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Thêm mới</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="function.php" method="POST" enctype="multipart/form-data">
                                                    <div class="col">
                                                        <div class="row">
                                                        <div class="col-6">
                                                            <label for="category-film"
                                                                class="col-form-label">Họ tên khách hàng:</label>
                                                                <input type="text" class="form-control" id="category-film" name="hoten" required>
                                                        </div>
                                                        <div class="col-6">
                                                            <label for="category-film"
                                                                class="col-form-label">Số điện thoại:</label>
                                                                <input type="number" class="form-control" id="category-film" name="sodienthoai" required>
                                                        </div>
                                                        </div>
                                                        <div class="row">
                                                        <div class="col-6">
                                                            <label for="category-film"
                                                                class="col-form-label">Email:</label>
                                                                <input type="email" class="form-control" id="category-film" name="email" required>
                                                        </div>
                                                        <div class="col-6">
                                                            <label for="category-film"
                                                                class="col-form-label">Tình trạng dịch vụ:</label>
                                                                <input type="text" class="form-control" id="category-film" name="tinhtrangdichvu" required>
                                                        </div>
                                                        </div>
                                                        <div class="row">
                                                        <div class="col-12">
                                                            <label for="category-film"
                                                                class="col-form-label">Chọn dịch vụ:</label>
                                                                <select multiple="multiple" class="form-select"  aria-label="Default select example" id="theloai" tabindex="8" name="dichvu[]" required>
                                                                    <?php
                                                                     $dvU = mysqli_query($connect, "SELECT a.*, b.tenloaibaidang 
                                                                     FROM baidang as a, loaibaidang as b
                                                                     WHERE a.loaibaidang_id = b.id
                                                                     AND a.loaibaidang_id IN
                                                                     (SELECT id FROM loaibaidang
                                                                     WHERE demuc = 'Dịch Vụ')");
                                                                     while ($arDvU = mysqli_fetch_array($dvU, MYSQLI_ASSOC)) {
                                                                    ?>
                                                                    <option value="<?php echo $arDvU['id']; ?>" ><?php echo $arDvU['tieude']; ?> - ( <?php echo $arDvU['tenloaibaidang']; ?>)</option>
                                                                    <?php } ?>
                                                                </select>
                                                        </div>
                                                        </div>
                                                    </div>
                                                        <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                        data-bs-dismiss="modal">Đóng</button>
                                                    <button type="submit" class="btn btn-primary" name="addkh">Lưu </button>
                                                </div>
                                                    </form>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Modal Update-->
                                    

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
            <?php include('inc/footer.php')?>
        </div>
    </div>
    <script>
    CKEDITOR.replace("editor");
    </script>
    <script>
for (var i = 1; i < 200; i++) {
    var name = "editor" + i
    CKEDITOR.replace(name);

}

</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
</body>

</html>