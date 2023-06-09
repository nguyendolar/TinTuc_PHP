<?php
include('inc/connect.php');
$adminid = $_SESSION['id'];
if(isset($_POST['addsp'])){
    $ten = $_POST['tensp'];
    $loaisp  = $_POST['loaisp'];
    //Upload ảnh
    $file_name = $_FILES['image']['name'];
    $file_size = $_FILES['image']['size'];
    $file_tmp = $_FILES['image']['tmp_name'];
    $file_type = $_FILES['image']['type'];
    $file_parts =explode('.',$_FILES['image']['name']);
    $file_ext=strtolower(end($file_parts));
    $expensions= array("jpeg","jpg","png");
    $image = $_FILES['image']['name'];
    $target = "./image/".basename($image);
    move_uploaded_file($_FILES['image']['tmp_name'], $target);
    $query = "INSERT INTO sanpham ( tensanpham, anhsanpham, loaisanpham_id, admin_id) 
    VALUES ( '{$ten}', '{$image}', '{$loaisp}', '{$adminid}') ";
    $result = mysqli_query($connect, $query);
    if ($result) {
      header("Location: sanpham.php?msg=1");
    } 
    else {
        header("Location: sanpham.php?msg=2");
    }
}
if(isset($_POST['editsp'])){
    $ten = $_POST['tensp'];
    $loaisp  = $_POST['loaisp'];
    $id  = $_POST['id'];
    //Upload ảnh
    $file_name = $_FILES['image']['name'];
    if(empty($file_name)){
        $query = "UPDATE `sanpham` 
        SET `tensanpham`='{$ten}',`loaisanpham_id`='{$loaisp}'
        WHERE `id`='{$id}'";
        $result = mysqli_query($connect, $query);
        if ($result) {
          header("Location: sanpham.php?msg=1");
        } 
        else {
            header("Location: sanpham.php?msg=2");
        }
    }
    else{
        $file_size = $_FILES['image']['size'];
        $file_tmp = $_FILES['image']['tmp_name'];
        $file_type = $_FILES['image']['type'];
        $file_parts =explode('.',$_FILES['image']['name']);
        $file_ext=strtolower(end($file_parts));
        $expensions= array("jpeg","jpg","png");
        $image = $_FILES['image']['name'];
        $target = "./image/".basename($image);
        move_uploaded_file($_FILES['image']['tmp_name'], $target);
        $query = "UPDATE `sanpham` 
        SET `tensanpham`='{$ten}',`anhsanpham`='{$image}',`loaisanpham_id`='{$loaisp}'
        WHERE `id`='{$id}'";
        $result = mysqli_query($connect, $query);
        if ($result) {
          header("Location: sanpham.php?msg=1");
        } 
        else {
            header("Location: sanpham.php?msg=2");
        }
    }
    
}
if(isset($_POST['deletesp'])){
    $id  = $_POST['id'];
    $query = "DELETE FROM sanpham WHERE `id`='{$id}'";
    $result = mysqli_query($connect, $query);
    header("Location: sanpham.php?msg=1");
    
}
//
if(isset($_POST['addbd'])){
    $tieude = $_POST['tieude'];
    $noidung  = $_POST['noidung'];
    $loaibd = $_POST['loaibd'];
    $tacgia = $_POST['tacgia'];
    //Upload ảnh
    $file_name = $_FILES['image']['name'];
    $file_size = $_FILES['image']['size'];
    $file_tmp = $_FILES['image']['tmp_name'];
    $file_type = $_FILES['image']['type'];
    $file_parts =explode('.',$_FILES['image']['name']);
    $file_ext=strtolower(end($file_parts));
    $expensions= array("jpeg","jpg","png");
    $image = $_FILES['image']['name'];
    $target = "./image/".basename($image);
    move_uploaded_file($_FILES['image']['tmp_name'], $target);
    $query = "INSERT INTO baidang ( loaibaidang_id, tieude, anh, noidung, tacgia, admin_id) 
    VALUES ( '{$loaibd}', '{$tieude}', '{$image}', '{$noidung}', '{$tacgia}', '{$adminid}') ";
    $result = mysqli_query($connect, $query);
    if ($result) {
      header("Location: baidang.php?msg=1");
    } 
    else {
        header("Location: baidang.php?msg=2");
    }
}
if(isset($_POST['editbd'])){
    $tieude = $_POST['tieude'];
    $noidung  = $_POST['noidung'];
    $loaibd = $_POST['loaibd'];
    $tacgia = $_POST['tacgia'];
    $id  = $_POST['id'];
    //Upload ảnh
    $file_name = $_FILES['image']['name'];
    if(empty($file_name)){
        $query = "UPDATE `baidang` 
        SET `tieude`='{$tieude}',`loaibaidang_id`='{$loaibd}',`tacgia`='{$tacgia}',`noidung`='{$noidung}'
        WHERE `id`='{$id}'";
        $result = mysqli_query($connect, $query);
        if ($result) {
          header("Location: baidang.php?msg=1");
        } 
        else {
            header("Location: baidang.php?msg=2");
        }
    }
    else{
        $file_size = $_FILES['image']['size'];
        $file_tmp = $_FILES['image']['tmp_name'];
        $file_type = $_FILES['image']['type'];
        $file_parts =explode('.',$_FILES['image']['name']);
        $file_ext=strtolower(end($file_parts));
        $expensions= array("jpeg","jpg","png");
        $image = $_FILES['image']['name'];
        $target = "./image/".basename($image);
        move_uploaded_file($_FILES['image']['tmp_name'], $target);
        $query = "UPDATE `baidang` 
        SET `tieude`='{$tieude}',`anh`='{$image}',`loaibaidang_id`='{$loaibd}',`tacgia`='{$tacgia}',`noidung`='{$noidung}'
        WHERE `id`='{$id}'";
        $result = mysqli_query($connect, $query);
        if ($result) {
          header("Location: baidang.php?msg=1");
        } 
        else {
            header("Location: baidang.php?msg=2");
        }
    }
    
}
if(isset($_POST['deletebd'])){
    $id  = $_POST['id'];
    $check = "SELECT * FROM khachhangdichvu WHERE dichvu_id = '{$id}'";
    $excute = mysqli_query($connect, $check);
    $row = mysqli_num_rows($excute);
    if($row > 0)
    {
        header("Location: baidang.php?msg=2");
    }
    else
    {
        $queryxoa = "DELETE FROM binhluandanhgia WHERE `baidang_id`='{$id}'";
        $resultxoa = mysqli_query($connect, $queryxoa);
        $query = "DELETE FROM baidang WHERE `id`='{$id}'";
        $result = mysqli_query($connect, $query);
        header("Location: baidang.php?msg=1");
    }
}
//
if(isset($_POST['addlbd'])){
    $tenloaibaidang = $_POST['tenloaibaidang'];
    $demuc  = $_POST['demuc'];
    $query = "INSERT INTO loaibaidang (tenloaibaidang, demuc) 
    VALUES ( '{$tenloaibaidang}', '{$demuc}') ";
    $result = mysqli_query($connect, $query);
    if ($result) {
      header("Location: loaibaidang.php?msg=1");
    } 
    else {
        header("Location: loaibaidang.php?msg=2");
    }
}
if(isset($_POST['editlbd'])){
    $tenloaibaidang = $_POST['tenloaibaidang'];
    $demuc  = $_POST['demuc'];
    $id  = $_POST['id'];
    $query = "UPDATE `loaibaidang` 
        SET `tenloaibaidang`='{$tenloaibaidang}',`demuc`='{$demuc}'
        WHERE `id`='{$id}'";
    $result = mysqli_query($connect, $query);
    if ($result) {
        header("Location: loaibaidang.php?msg=1");
    } 
    else {
        header("Location: loaibaidang.php?msg=2");
    }
}
if(isset($_POST['deletelbd'])){
    $id  = $_POST['id'];
    $check = "SELECT * FROM baidang WHERE loaibaidang_id = '{$id}'";
    $excute = mysqli_query($connect, $check);
    $row = mysqli_num_rows($excute);
    if($row > 0)
    {
        header("Location: loaibaidang.php?msg=2");
    }
    else
    {
        $query = "DELETE FROM loaibaidang WHERE `id`='{$id}'";
        $result = mysqli_query($connect, $query);
        header("Location: loaibaidang.php?msg=1");
    }
}
//
//
if(isset($_POST['addlsp'])){
    $tenloaisanpham = $_POST['tenloaisanpham'];
    $query = "INSERT INTO loaisanpham (tenloaisanpham) 
    VALUES ( '{$tenloaisanpham}') ";
    $result = mysqli_query($connect, $query);
    if ($result) {
      header("Location: loaisanpham.php?msg=1");
    } 
    else {
        header("Location: loaisanpham.php?msg=2");
    }
}
if(isset($_POST['editlsp'])){
    $tenloaisanpham = $_POST['tenloaisanpham'];
    $id  = $_POST['id'];
    $query = "UPDATE `loaisanpham` 
        SET `tenloaisanpham`='{$tenloaisanpham}'
        WHERE `id`='{$id}'";
    $result = mysqli_query($connect, $query);
    if ($result) {
        header("Location: loaisanpham.php?msg=1");
    } 
    else {
        header("Location: loaisanpham.php?msg=2");
    }
}
if(isset($_POST['deletelsp'])){
    $id  = $_POST['id'];
    $check = "SELECT * FROM sanpham WHERE loaisanpham_id = '{$id}'";
    $excute = mysqli_query($connect, $check);
    $row = mysqli_num_rows($excute);
    if($row > 0)
    {
        header("Location: loaisanpham.php?msg=2");
    }
    else
    {
        $query = "DELETE FROM loaisanpham WHERE `id`='{$id}'";
        $result = mysqli_query($connect, $query);
        header("Location: loaisanpham.php?msg=1");
    }
}
//
//
if(isset($_POST['addkh'])){
    $hoten = $_POST['hoten'];
    $sodienthoai  = $_POST['sodienthoai'];
    $email = $_POST['email'];
    $listdichvu  = $_POST['dichvu'];
    $ttdichvu = $_POST['tinhtrangdichvu'];
    $query = "INSERT INTO khachhang ( `hoten`, `sodienthoai`, `email`, `tinhtrangdichvu`, `admin_id`) 
    VALUES ( '{$hoten}', '{$sodienthoai}', '{$email}', '{$ttdichvu}', '{$adminid}') ";
    $result = mysqli_query($connect, $query);
    if ($result) {
        $check = "SELECT id FROM khachhang Order by id DESC Limit 1";
        $excute = mysqli_query($connect, $check);
        $arDvs = mysqli_fetch_array($excute);
        $khid = $arDvs['id'];
        foreach ($listdichvu as $dichvu){
            $querydv = "INSERT INTO khachhangdichvu ( `dichvu_id`, `khachhang_id`) VALUES ( '{$dichvu}', '{$khid}') ";
            $resultdv = mysqli_query($connect, $querydv);
        }
      header("Location: khachhang.php?msg=1");
    } 
    else {
        header("Location: khachhang.php?msg=2");
    }
}
if(isset($_POST['editkh'])){
    $hoten = $_POST['hoten'];
    $sodienthoai  = $_POST['sodienthoai'];
    $email = $_POST['email'];
    $listdichvu  = $_POST['dichvu'];
    $ttdichvu = $_POST['tinhtrangdichvu'];
    $id  = $_POST['id'];
    $query = "UPDATE `khachhang` 
        SET `hoten`='{$hoten}',`sodienthoai`='{$sodienthoai}',`email`='{$email}',`tinhtrangdichvu`='{$ttdichvu}'
        WHERE `id`='{$id}'";
    $result = mysqli_query($connect, $query);
    $querykh = "DELETE FROM khachhangdichvu WHERE `khachhang_id`='{$id}'";
    $resultkh = mysqli_query($connect, $querykh);
    foreach ($listdichvu as $dichvu){
        $querydv = "INSERT INTO khachhangdichvu ( `dichvu_id`, `khachhang_id`) VALUES ( '{$dichvu}', '{$id}') ";
        $resultdv = mysqli_query($connect, $querydv);
    }
    if ($result) {
        header("Location: khachhang.php?msg=1");
    } 
    else {
        header("Location: khachhang.php?msg=2");
    }
}
if(isset($_POST['deletekh'])){
    $id  = $_POST['id'];
    $querykh = "DELETE FROM khachhangdichvu WHERE `khachhang_id`='{$id}'";
    $resultkh = mysqli_query($connect, $querykh);
    $query = "DELETE FROM khachhang WHERE `id`='{$id}'";
    $result = mysqli_query($connect, $query);
    header("Location: khachhang.php?msg=1");
}
if(isset($_POST['deletend'])){
    $id  = $_POST['id'];
    $queryxoa = "DELETE FROM binhluandanhgia WHERE `nguoidung_id`='{$id}'";
    $resultxoa = mysqli_query($connect, $queryxoa);
    $query = "DELETE FROM nguoidung WHERE `id`='{$id}'";
    $result = mysqli_query($connect, $query);
    header("Location: nguoidung.php?msg=1");
}
if(isset($_POST['deletebldg'])){
    $id  = $_POST['id'];
    $queryxoa = "DELETE FROM binhluandanhgia WHERE `traloi`='{$id}'";
    $resultxoa = mysqli_query($connect, $queryxoa);
    $query = "DELETE FROM binhluandanhgia WHERE `id`='{$id}'";
    $result = mysqli_query($connect, $query);
    header("Location: binhluandanhgia.php?msg=1");
}
if(isset($_POST['editanh'])){
    $id  = $_POST['id'];
    //Upload ảnh
    $file_name = $_FILES['image']['name'];
    $file_size = $_FILES['image']['size'];
    $file_tmp = $_FILES['image']['tmp_name'];
    $file_type = $_FILES['image']['type'];
    $file_parts =explode('.',$_FILES['image']['name']);
    $file_ext=strtolower(end($file_parts));
    $expensions= array("jpeg","jpg","png");
    $image = $_FILES['image']['name'];
    $target = "./image/".basename($image);
    move_uploaded_file($_FILES['image']['tmp_name'], $target);
    $query = "UPDATE `anh` 
    SET `tenanh`='{$image}'
    WHERE `id`= 1";
    $result = mysqli_query($connect, $query);
    if ($result) {
        header("Location: anh.php?msg=1");
    } 
    else {
        header("Location: anh.php?msg=2");
    }
}
?>
 