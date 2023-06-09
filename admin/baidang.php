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
                <?php
                $dv = mysqli_query($connect, "SELECT * FROM loaibaidang
                WHERE demuc = 'Dịch Vụ'");
                $nkst = mysqli_query($connect, "SELECT * FROM loaibaidang
                WHERE demuc = 'Nhật Ký Sáng Tạo'");
                $tt = mysqli_query($connect, "SELECT * FROM loaibaidang
                WHERE demuc = 'Tin Tức'");
                ?>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Danh sách bài đăng</h1>
                    <div class="card mb-4">
                        <div class="card-header">
                        <?php if (isset($_GET['msg'])){
                            if($_GET['msg'] == 1){ ?>
                             <div class="alert alert-success">
                                <strong>Thành công</strong>
                            </div>
                            <?php } else { ?>
                                <div class="alert alert-danger">
                                <strong>Bài đăng đang được khách hàng book dịch vụ quảng cáo. Không thể xóa !</strong>
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
                                        <th>Tiêu đề</th>
                                        <th>Ảnh</th>
                                        <th>Nội dung</th>
                                        <th>Loại bài đăng</th>
                                        <th>Tác giả</th>
                                        <th>Ngày đăng</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php 
                                $idad = $_SESSION['id'];
                                if($_SESSION['capdo'] == 1){
                                    $query = "SELECT a.*,b.tenloaibaidang FROM baidang as a,loaibaidang as b
                                    WHERE a.loaibaidang_id = b.id
                                    ORDER BY a.id DESC";
                                }else{
                                    $query = "SELECT a.*,b.tenloaibaidang FROM baidang as a,loaibaidang as b
                                    WHERE a.loaibaidang_id = b.id
                                    AND a.admin_id = $idad
                                    ORDER BY a.id DESC";
                                }
                                    
                                    $result = mysqli_query($connect, $query);
                                    $stt = 1;
                                    while ($arUser = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                        $idModelDel = "exampleModalDel".$arUser["id"] ;
                                        $idModelDes = "exampleModalDes".$arUser["id"] ;
                                        $idModelEdit = "exampleModalEdit".$arUser["id"];
                                    ?>
                                    <tr>
                                        <td><?php echo $stt ?></td>
                                        <td><?php echo $arUser["tieude"] ?></td>
                                        <td><img style="width: 200px !important;height: 130px !important;" src="./image/<?php echo $arUser['anh'] ?>"></td>
                                        <td>
                                            <a href="" data-bs-toggle="modal"
                                                data-bs-target="#<?php echo $idModelDes ?>">
                                                Xem</a>
                                        </td>
                                        <td><?php echo $arUser["tenloaibaidang"] ?> </td>
                                        <td><?php echo $arUser["tacgia"] ?></td>
                                        <td><?php echo date("d-m-Y", strtotime($arUser["thoigiandang"])); ?></td>
                                        <td style="width : 130px !important">
                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                data-bs-target="#<?php echo $idModelEdit ?>">
                                                Sửa
                                            </button>
                                            <?php if($arUser["id"] == 1 || $arUser["id"] == 2 ) {

                                            }else{ ?>
                                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                                data-bs-target="#<?php echo $idModelDel ?>">
                                                Xóa
                                            </button>
                                            <?php }?>
                                            
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
                                                            Bài đăng : <?php echo $arUser["tieude"] ?>
                                                            <form action="function.php" method="post">
                                                                <input type="hidden" class="form-control" id="id" name="id" value="<?php echo $arUser["id"] ?>">
                                                                <div class="modal-footer" style="margin-top: 20px">
                                                                    <button style="width:100px" type="button" class="btn btn-secondary"
                                                                            data-bs-dismiss="modal">
                                                                        Đóng
                                                                    </button>
                                                                    <button style="width:100px" type="submit" class="btn btn-danger" name="deletebd"> Xóa</button>

                                                                </div>

                                                            </form>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <!--Dele-->
                                            <!--Des-->
                                            <div class="modal fade" id="<?php echo $idModelDes ?>" tabindex="-1"
                                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-xl">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel"><?php echo $arUser["tieude"] ?></h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                    aria-label="Close"></button>
                                                        </div>

                                                        <div class="modal-body">
                                                            <?php echo $arUser["noidung"] ?>
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
                                                                class="col-form-label">Loại bài đăng:</label>
                                                                <select class="form-select" aria-label="Default select example" id="theloai" tabindex="8" name="loaibd" required>
                                                                    <option value="<?php echo $arUser["loaibaidang_id"] ?>" selected><?php echo $arUser["tenloaibaidang"] ?></option>
                                                                    <option value="" disabled="disabled" >Dịch vụ</option>
                                                                    <?php
                                                                     $dvU = mysqli_query($connect, "SELECT * FROM loaibaidang
                                                                     WHERE demuc = 'Dịch Vụ'");
                                                                     while ($arDvU = mysqli_fetch_array($dvU, MYSQLI_ASSOC)) {
                                                                    ?>
                                                                    <option value="<?php echo $arDvU['id']; ?>" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $arDvU['tenloaibaidang']; ?></option>
                                                                    <?php } ?>
                                                                    <option value="" disabled="disabled" >Nhật ký sáng tạo</option>
                                                                    <?php
                                                                    $nkstU = mysqli_query($connect, "SELECT * FROM loaibaidang
                                                                    WHERE demuc = 'Nhật Ký Sáng Tạo'");
                                                                     while ($arNkstU = mysqli_fetch_array($nkstU, MYSQLI_ASSOC)) {
                                                                    ?>
                                                                    <option value="<?php echo $arNkstU['id']; ?>" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $arNkstU['tenloaibaidang']; ?></option>
                                                                    <?php } ?>
                                                                    <option value="" disabled="disabled" >Tin tức</option>
                                                                    <?php
                                                                    $ttU = mysqli_query($connect, "SELECT * FROM loaibaidang
                                                                    WHERE demuc = 'Tin Tức'");
                                                                     while ($arTtU = mysqli_fetch_array($ttU, MYSQLI_ASSOC)) {
                                                                    ?>
                                                                    <option value="<?php echo $arTtU['id']; ?>" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $arTtU['tenloaibaidang']; ?></option>
                                                                    <?php } ?>
                                                                </select>
                                                        </div>
                                                        <div class="col-6">
                                                            <label for="category-film"
                                                                class="col-form-label">Ảnh:</label>
                                                                <input type="hidden" name="size" value="1000000"> 
                                                                <input type="file" class="form-control" name="image"/>
                                                        </div>
                                                        </div>
                                                        <div class="row">
                                                        <div class="col-6">
                                                            <label for="category-film"
                                                                class="col-form-label">Tiêu đề:</label>
                                                                <input type="text" class="form-control" id="category-film" value="<?php echo $arUser["tieude"] ?>" name="tieude" required>
                                                        </div>
                                                        <div class="col-6">
                                                            <label for="category-film"
                                                                class="col-form-label">Tác giả:</label>
                                                                <input type="text" class="form-control" id="category-film" value="<?php echo $arUser["tacgia"] ?>" name="tacgia" required>
                                                        </div>
                                                        </div>
                                                        <?php
                                                            $edit = "editor".$stt;
                                                        ?>
                                                        <div class="row">
                                                        <div class="col-12">
                                                            <label for="category-film"
                                                                class="col-form-label">Nội dung:</label>
                                                                <textarea name="noidung" id="<?php echo $edit ?>" cols="30" tabindex="8" rows="30"><?php echo $arUser["noidung"] ?></textarea>
                                                        </div>
                                                        </div>
                                                    </div>
                                                        <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                        data-bs-dismiss="modal">Đóng</button>
                                                    <button type="submit" class="btn btn-primary" name="editbd">Lưu</button>
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
                                                                class="col-form-label">Loại bài đăng:</label>
                                                                <select class="form-select" aria-label="Default select example" id="theloai" tabindex="8" name="loaibd" required>
                                                                    <option value="" selected>Chọn loại bài đăng</option>
                                                                    <option value="" disabled="disabled" >Dịch vụ</option>
                                                                    <?php
                                                                     while ($arDv = mysqli_fetch_array($dv, MYSQLI_ASSOC)) {
                                                                    ?>
                                                                    <option value="<?php echo $arDv['id']; ?>" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $arDv['tenloaibaidang']; ?></option>
                                                                    <?php } ?>
                                                                    <option value="" disabled="disabled" >Nhật ký sáng tạo</option>
                                                                    <?php
                                                                     while ($arNkst = mysqli_fetch_array($nkst, MYSQLI_ASSOC)) {
                                                                    ?>
                                                                    <option value="<?php echo $arNkst['id']; ?>" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $arNkst['tenloaibaidang']; ?></option>
                                                                    <?php } ?>
                                                                    <option value="" disabled="disabled" >Tin tức</option>
                                                                    <?php
                                                                     while ($arTt = mysqli_fetch_array($tt, MYSQLI_ASSOC)) {
                                                                    ?>
                                                                    <option value="<?php echo $arTt['id']; ?>" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $arTt['tenloaibaidang']; ?></option>
                                                                    <?php } ?>
                                                                </select>
                                                        </div>
                                                        <div class="col-6">
                                                            <label for="category-film"
                                                                class="col-form-label">Ảnh:</label>
                                                                <input type="hidden" name="size" value="1000000"> 
                                                                <input type="file" class="form-control" name="image" required/>
                                                        </div>
                                                        </div>
                                                        <div class="row">
                                                        <div class="col-6">
                                                            <label for="category-film"
                                                                class="col-form-label">Tiêu đề:</label>
                                                                <input type="text" class="form-control" id="category-film" name="tieude" required>
                                                        </div>
                                                        <div class="col-6">
                                                            <label for="category-film"
                                                                class="col-form-label">Tác giả:</label>
                                                                <input type="text" class="form-control" id="category-film" name="tacgia" required>
                                                        </div>
                                                        </div>
                                                        <div class="row">
                                                        <div class="col-12">
                                                            <label for="category-film"
                                                                class="col-form-label">Nội dung:</label>
                                                                <textarea name="noidung" id="editor" cols="30" tabindex="8" rows="30"></textarea>
                                                        </div>
                                                        </div>
                                                    </div>
                                                        <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                        data-bs-dismiss="modal">Đóng</button>
                                                    <button type="submit" class="btn btn-primary" name="addbd">Lưu </button>
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