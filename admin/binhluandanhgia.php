
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
                    <h1 class="mt-4">Danh sách bình luận đánh giá</h1>
                    <div class="card mb-4">
                        <div class="card-header">
                        <?php if (isset($_GET['msg'])){
                            if($_GET['msg'] == 1){ ?>
                             <div class="alert alert-success">
                                <strong>Thành công</strong>
                            </div>
                            <?php }  ?> 
                            <?php }  ?>   
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                <tr style="background-color : #6D6D6D">
                                        <th>STT</th>
                                        <th>Người dùng</th>
                                        <th>Bài đăng</th>
                                        <th>Bình luận</th>
                                        <th>Đánh giá</th>
                                        <th>Ngày</th>
                                        <th>Trả lời cho bình luận</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php 
                                    $query = "SELECT a.*,b.hoten,c.tieude
                                    FROM binhluandanhgia as a, nguoidung as b, baidang as c
                                    WHERE a.nguoidung_id = b.id AND a.baidang_id = c.id
                                    ORDER BY a.id DESC";
                                    $result = mysqli_query($connect, $query);
                                    $stt = 1;
                                    while ($arUser = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                        $idModelDel = "exampleModalDel".$arUser["id"] ;
                                        $idtraloi = $arUser["traloi"];
                                        $idModelBinhluan = "exampleModalBinhluan".$arUser["id"] ;
                                        $idModelTraloi = "exampleModalTraloi".$arUser["id"] ;
                                    ?>
                                    <tr>
                                        <td style="width : 10px !important"><?php echo $stt ?></td>
                                        <td style="width : 200px !important"><?php echo $arUser["hoten"] ?></td>
                                        <td><a target="_blank" rel="noopener noreferrer" href="/i-map/user/chitiet.php?id=<?php echo $arUser["baidang_id"] ?>"><?php echo $arUser["tieude"] ?></a></td>
                                        <td >
                                        <a href="" data-bs-toggle="modal"
                                                data-bs-target="#<?php echo $idModelBinhluan ?>">
                                                Xem</a>
                                        </td>
                                        <td>
                                            <?php if($arUser["traloi"] == 0){ 
                                                    switch ($arUser['danhgia']) {
                                                        case 1:
                                                            echo '⭐';
                                                            break;
                                                        case 2:
                                                            echo '⭐⭐';
                                                            break;
                                                        case 3:
                                                            echo '⭐⭐⭐';
                                                            break;
                                                        case 4:
                                                            echo '⭐⭐⭐⭐';
                                                            break;
                                                        default:
                                                            echo '⭐⭐⭐⭐⭐';
                                                            break;
                                                    }
                                                   } ?>
                                        </td>
                                        <td style="width : 100px !important"><?php echo $arUser["ngay"] ?></td>
                                        <td>
                                        <?php if($arUser["traloi"] != 0){ ?>
                                            <a href="" data-bs-toggle="modal"
                                                data-bs-target="#<?php echo $idModelTraloi ?>">
                                                Xem</a>
                                            </td>
                                            <?php } ?>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                                data-bs-target="#<?php echo $idModelDel ?>">
                                                Xóa
                                            </button>
                                            <!--Binhluan-->
                                            <div class="modal fade" id="<?php echo $idModelBinhluan ?>" tabindex="-1"
                                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-xl">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Nội dung bình luận của <?php echo $arUser["hoten"] ?></h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                    aria-label="Close"></button>
                                                        </div>

                                                        <div class="modal-body">
                                                            <?php echo $arUser["binhluan"] ?>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--Traloi-->
                                            <div class="modal fade" id="<?php echo $idModelTraloi ?>" tabindex="-1"
                                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-xl">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Trả lời bình luận</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                    aria-label="Close"></button>
                                                        </div>

                                                        <div class="modal-body">
                                                        <?php $sql = "
                                                    SELECT a.*,b.hoten,c.tieude
                                                    FROM binhluandanhgia as a, nguoidung as b, baidang as c
                                                    WHERE a.nguoidung_id = b.id AND a.baidang_id = c.id
                                                    AND a.id = '".$idtraloi."'
                                                ";
                                            $querytl = mysqli_query($connect, $sql);
                                            $row = mysqli_fetch_array($querytl);?>
                                            <?php echo $row["hoten"] ?> :  <?php echo $row["binhluan"] ?>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
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
                                                            Bình luận : <?php echo $arUser["binhluan"] ?> . Của người dùng : <?php echo $arUser["hoten"] ?>
                                                            <form action="function.php" method="post">
                                                                <input type="hidden" class="form-control" id="id" name="id" value="<?php echo $arUser["id"] ?>">
                                                                <div class="modal-footer" style="margin-top: 20px">
                                                                    <button style="width:100px" type="button" class="btn btn-secondary"
                                                                            data-bs-dismiss="modal">
                                                                        Đóng
                                                                    </button>
                                                                    <button style="width:100px" type="submit" class="btn btn-danger" name="deletebldg"> Xóa</button>

                                                                </div>

                                                            </form>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <!--Dele-->
                                        </td>

                                    </tr>
                                    <?php $stt++;} ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
            <?php include('inc/footer.php')?>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
</body>

</html>