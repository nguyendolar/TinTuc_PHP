-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 09, 2023 lúc 01:39 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `websitetintuc`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(11) NOT NULL,
  `tintuc_id` int(11) DEFAULT NULL,
  `nguoidung_id` int(11) DEFAULT NULL,
  `noidung` text DEFAULT NULL,
  `ngay` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chude`
--

CREATE TABLE `chude` (
  `id` int(11) NOT NULL,
  `ten` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chude`
--

INSERT INTO `chude` (`id`, `ten`) VALUES
(1, 'Giáo dục'),
(2, 'Chính trị'),
(3, 'Kinh tế'),
(4, 'Xã hội'),
(5, 'Thể thao'),
(6, 'Giải trí'),
(7, 'Công nghệ'),
(8, 'Khoa học'),
(9, 'Sức khỏe'),
(10, 'Môi trường');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gopy`
--

CREATE TABLE `gopy` (
  `id` int(11) NOT NULL,
  `hoten` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `tieude` varchar(500) NOT NULL,
  `noidung` text DEFAULT NULL,
  `ngay` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `id` int(11) NOT NULL,
  `hoten` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `taikhoan` varchar(255) NOT NULL,
  `matkhau` varchar(255) NOT NULL,
  `vaitro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`id`, `hoten`, `email`, `taikhoan`, `matkhau`, `vaitro`) VALUES
(1, 'Lê Văn A', 'levana@gmail.com', 'levana', '123456', 2),
(3, 'Quản Trị Viên', 'admin@gmail.com', 'admin', '123456', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tintuc`
--

CREATE TABLE `tintuc` (
  `id` int(11) NOT NULL,
  `chude_id` int(11) DEFAULT NULL,
  `tieude` varchar(255) NOT NULL,
  `anh` varchar(500) NOT NULL,
  `noidung` text DEFAULT NULL,
  `ngay` datetime NOT NULL DEFAULT current_timestamp(),
  `nguoidung_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tintuc`
--

INSERT INTO `tintuc` (`id`, `chude_id`, `tieude`, `anh`, `noidung`, `ngay`, `nguoidung_id`) VALUES
(4, 4, 'Giá xăng giữ nguyên, dầu tăng nhẹ', 'gia-xang-16865536441451116152520-0-0-776-1242-crop-1686553648935662662516.jpg', '<h2><span style=\"font-size:14px\">Gi&aacute; xăng được giữ nguy&ecirc;n trong khi gi&aacute; dầu điều chỉnh tăng nhẹ kể từ 15h chiều nay (12-6) theo c&aacute;c doanh nghiệp kinh doanh xăng dầu.</span></h2>\r\n\r\n<p><span style=\"font-size:14px\">C&aacute;c mặt h&agrave;ng xăng dầu giữ nguy&ecirc;n mức gi&aacute; như kỳ trước. Cụ thể, xăng E5RON92 c&oacute; gi&aacute; 20.870 đồng/l&iacute;t; xăng RON95-III c&oacute; gi&aacute; 22.010 đồng/l&iacute;t.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Trong khi đ&oacute;, c&aacute;c mặt h&agrave;ng dầu đa phần tăng nhẹ, trừ dầu mazut 180CST 3.5S. Cụ thể, với&nbsp;<a href=\"https://tuoitre.vn/chieu-nay-11-5-gia-xang-giam-1-300-dong-lit-2023051114162748.htm\" title=\"dầu diesel\">dầu diesel</a>&nbsp;0.05S c&oacute; gi&aacute; 18.028 đồng/l&iacute;t, tăng 85 đồng/l&iacute;t; dầu hỏa c&oacute; mức gi&aacute; 17.823 đồng/l&iacute;t, tăng 52 đồng/l&iacute;t; dầu mazut 180CST 3.5S c&oacute; mức gi&aacute; 14.719 đồng/kg, giảm 164 đồng/kg so với gi&aacute; b&aacute;n lẻ hiện h&agrave;nh.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Ở kỳ điều h&agrave;nh n&agrave;y, cơ quan quản l&yacute; thay đổi mức tr&iacute;ch lập với c&aacute;c mặt h&agrave;ng xăng dầu. Cụ thể, thực hiện tr&iacute;ch lập quỹ b&igrave;nh ổn gi&aacute; đối với mặt h&agrave;ng xăng E5RON92 ở mức 228 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t), xăng RON95 ở mức 180 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t).</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Với mặt h&agrave;ng dầu, mức tr&iacute;ch lập cho dầu diesel ở mức 200 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t); dầu hỏa ở mức 200 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t); dầu mazut ở mức 100 đồng/kg (kỳ trước 300 đồng/kg). Đồng thời,&nbsp;<a href=\"https://tuoitre.vn/quy-binh-on-gia-xang-dau-hien-giao-doanh-nghiep-quan-la-khong-hop-ly-20230406105235064.htm\" title=\"quỹ bình ổn xăng dầu\">quỹ b&igrave;nh ổn xăng dầu</a>&nbsp;kh&ocirc;ng d&ugrave;ng với tất cả mặt h&agrave;ng xăng, dầu.</span></p>\r\n\r\n<p><span style=\"font-size:14px\"><a href=\"https://tuoitre.vn/de-nghi-danh-gia-lai-hieu-qua-cua-quy-binh-on-gia-xang-dau-20230327113553442.htm\" target=\"_blank\"><img alt=\"Đề nghị đánh giá lại hiệu quả của Quỹ bình ổn giá xăng dầu\" src=\"https://cdn.tuoitre.vn/471584752817336320/2023/3/27/xangdau-1679891361449748121820-31-0-487-730-crop-16798913737592061094496.jpeg\" /></a></span></p>\r\n\r\n<p><span style=\"font-size:14px\">Cơ quan quản l&yacute; cho hay kỳ điều h&agrave;nh lần n&agrave;y, thị trường&nbsp;<a href=\"https://tuoitre.vn/chinh-phu-chi-dao-xem-xet-de-xuat-hoan-tra-chi-phi-loi-nhuan-cho-ban-le-xang-dau-20230417143629118.htm\" title=\"xăng dầu\">xăng dầu</a>&nbsp;thế giới chịu ảnh hưởng của c&aacute;c yếu tố như: dự b&aacute;o nhu cầu dầu th&ocirc; to&agrave;n cầu tiếp tục sẽ tăng trong năm nay do nhu cầu của Trung Quốc v&agrave; ảnh hưởng từ c&aacute;c động th&aacute;i cắt giảm sản lượng của OPEC+.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Như vậy&nbsp;<a href=\"https://tuoitre.vn/gia-xang.html\" title=\"giá xăng \">gi&aacute; xăng&nbsp;</a>đ&atilde; được giữ nguy&ecirc;n sau khi tăng hai lần li&ecirc;n tiếp. D&ugrave; tăng nhưng gi&aacute; nhi&ecirc;n liệu n&agrave;y đang ở mức thấp trong v&ograve;ng 20 th&aacute;ng.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">T&iacute;nh cả lần n&agrave;y, từ đầu năm, gi&aacute; xăng dầu đ&atilde; trải qua 17 lần điều chỉnh gi&aacute;. Trong đ&oacute; t&aacute;m lần tăng, s&aacute;u lần giảm v&agrave; ba lần giữ nguy&ecirc;n.</span></p>\r\n', '2023-06-12 15:14:50', 3),
(5, 1, 'Trường phổ thông Năng khiếu công bố điểm chuẩn vào lớp 10', '1943600867.jpg', '<h2><span style=\"font-size:14px\">H&ocirc;m nay 12-6, Trường phổ th&ocirc;ng Năng khiếu (Đại học Quốc gia TP.HCM) vừa c&ocirc;ng bố điểm thi v&agrave; điểm chuẩn v&agrave;o lớp 10 năm học 2023-2024.</span></h2>\r\n\r\n<p><span style=\"font-size:14px\">Theo đ&oacute;,&nbsp;<a href=\"https://tuoitre.vn/diem-chuan.html\" title=\"điểm chuẩn\">điểm chuẩn</a>&nbsp;v&agrave;o lớp 10 chuy&ecirc;n cụ thể như sau:</span></p>\r\n\r\n<p><span style=\"font-size:14px\"><a href=\"https://cdn.tuoitre.vn/471584752817336320/2023/6/12/diem-chuan-lop-10-16865407633751662854335.jpg\" rel=\"nofollow\" target=\"_blank\"><img alt=\"Trường phổ thông Năng khiếu công bố điểm chuẩn vào lớp 10 - Ảnh 1.\" id=\"img_592557694742798336\" src=\"https://cdn.tuoitre.vn/thumb_w/730/471584752817336320/2023/6/12/diem-chuan-lop-10-16865407633751662854335.jpg\" title=\"Trường phổ thông Năng khiếu công bố điểm chuẩn vào lớp 10 - Ảnh 1.\" /></a></span></p>\r\n\r\n<p><span style=\"font-size:14px\">Bảng điểm x&eacute;t tuyển của từng lớp chuy&ecirc;n cụ thể - Ảnh: MỸ DUNG</span></p>\r\n\r\n<p><span style=\"font-size:14px\">&nbsp;&nbsp;&nbsp;</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Trong đ&oacute;, TH1 l&agrave; ba m&ocirc;n kh&ocirc;ng chuy&ecirc;n v&agrave; m&ocirc;n to&aacute;n chuy&ecirc;n; TH2 l&agrave; ba m&ocirc;n kh&ocirc;ng chuy&ecirc;n v&agrave; m&ocirc;n vật l&yacute; chuy&ecirc;n; TH l&agrave; ba m&ocirc;n kh&ocirc;ng chuy&ecirc;n v&agrave; m&ocirc;n h&oacute;a học chuy&ecirc;n; TH4 l&agrave; ba m&ocirc;n kh&ocirc;ng chuy&ecirc;n v&agrave; m&ocirc;n sinh học chuy&ecirc;n; TH5 l&agrave; ba m&ocirc;n kh&ocirc;ng chuy&ecirc;n v&agrave; m&ocirc;n tin học chuy&ecirc;n; TH6 l&agrave; ba m&ocirc;n kh&ocirc;ng chuy&ecirc;n v&agrave; m&ocirc;n ngữ văn chuy&ecirc;n; TH7 l&agrave; ba m&ocirc;n kh&ocirc;ng chuy&ecirc;n v&agrave; m&ocirc;n tiếng Anh chuy&ecirc;n.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Tất cả th&iacute; sinh tra cứu kết quả thi v&agrave; kết quả&nbsp;<a href=\"https://tuoitre.vn/de-thi-van-lop-10-truong-pho-thong-nang-khieu-hoc-sinh-thich-thu-voi-dieu-em-muon-noi-o-tuoi-15-20220605113133737.htm\" title=\"trúng tuyển\">tr&uacute;ng tuyển</a>&nbsp;bằng m&atilde; định danh c&aacute; nh&acirc;n theo địa chỉ:&nbsp;<a href=\"https://tuyensinh.ptnk.edu.vn/search\" rel=\"nofollow\" target=\"_blank\">https://tuyensinh.ptnk.edu.vn/search</a></span></p>\r\n\r\n<p><span style=\"font-size:14px\">Th&iacute; sinh đủ điều kiện tr&uacute;ng tuyển v&agrave;o c&aacute;c lớp chuy&ecirc;n phải thực hiện cả 2 quy tr&igrave;nh, gồm: x&aacute;c nhận nhập học v&agrave; nộp hồ sơ nhập học.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Từ ng&agrave;y 17-6 đến 21-6, th&iacute; sinh phải thực hiện x&aacute;c nhận nhập học theo h&igrave;nh thức trực tuyến</span></p>\r\n', '2023-06-12 15:14:50', 3),
(6, 9, 'Thêm một người trong gia đình bị ngộ độc nấm tử vong', 'ngo-doc-nam-1686567681419581272786.jpg', '<h2><span style=\"font-size:14px\">Sau ba ng&agrave;y điều trị ngộ độc nấm, ti&ecirc;n lượng người vợ chuyển biến rất xấu n&ecirc;n gia đ&igrave;nh xin đưa về v&agrave; b&agrave; đ&atilde; mất tại nh&agrave;. Người con ti&ecirc;n lượng tốt hơn, cũng xin ph&eacute;p xuất viện về nh&agrave; nh&igrave;n mẹ lần cuối.</span></h2>\r\n\r\n<p><span style=\"font-size:14px\"><a href=\"https://cdn.tuoitre.vn/471584752817336320/2023/6/12/ngo-doc-nam-1686567681419581272786.jpg\" rel=\"nofollow\" target=\"_blank\"><img alt=\"Thêm một người trong gia đình bị ngộ độc nấm tử vong - Ảnh 1.\" id=\"img_592670602826981376\" src=\"https://cdn.tuoitre.vn/thumb_w/730/471584752817336320/2023/6/12/ngo-doc-nam-1686567681419581272786.jpg\" title=\"Thêm một người trong gia đình bị ngộ độc nấm tử vong - Ảnh 1.\" /></a></span></p>\r\n\r\n<p><span style=\"font-size:14px\">C&ugrave;ng ăn nấm h&aacute;i trong rừng, người chồng v&agrave; vợ đ&atilde; lần lượt tử vong, ri&ecirc;ng người con g&aacute;i 17 tuổi đ&atilde; cải thiện - Ảnh: Bệnh viện cung cấp</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Chiều 12-6, đại diện Bệnh viện Chợ Rẫy (TP.HCM) th&ocirc;ng tin nạn nh&acirc;n thứ 2 - người vợ trong gia đ&igrave;nh ba người (ở tỉnh T&acirc;y Ninh) ngộ độc nặng sau khi ăn&nbsp;<a href=\"https://tuoitre.vn/hai-nam-trong-rung-nau-an-khi-lam-ray-5-nguoi-bi-ngo-doc-nhap-vien-2021040810590375.htm\" target=\"_blank\" title=\"nấm rừng\">nấm rừng</a>&nbsp;x&agrave;o - đ&atilde; tử vong tại nh&agrave;.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Trước đ&oacute;, d&ugrave; được điều trị t&iacute;ch cực nhưng t&igrave;nh trạng sức khỏe của nữ bệnh nh&acirc;n n&agrave;y ng&agrave;y c&agrave;ng chuyển biến nặng, ti&ecirc;n lượng rất xấu n&ecirc;n gia đ&igrave;nh xin đưa b&agrave; về. Bệnh nh&acirc;n đ&atilde; tử vong tại nh&agrave; sau đ&oacute;.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">C&ograve;n người con g&aacute;i 17 tuổi, sức khỏe được cải thiện hơn v&agrave; cũng xin xuất viện để được về nh&agrave; lo hậu sự, nh&igrave;n mặt mẹ lần cuối.</span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:14px\"><a href=\"https://tuoitre.vn/trong-ba-ngay-tay-ninh-co-chin-nguoi-ngo-doc-nghi-do-an-nam-rung-20230609121803143.htm\" target=\"_blank\"><img alt=\"Trong 3 ngày, Tây Ninh có 9 người ngộ độc nghi do ăn nấm rừng\" src=\"https://cdn.tuoitre.vn/471584752817336320/2023/6/9/ngo-doc-nam-tay-ninh-1686287240630358226600-0-0-411-658-crop-1686287379866728019441.jpg\" /></a></span>\r\n\r\n	<h4><span style=\"font-size:14px\"><a href=\"https://tuoitre.vn/trong-ba-ngay-tay-ninh-co-chin-nguoi-ngo-doc-nghi-do-an-nam-rung-20230609121803143.htm\" target=\"_blank\">Trong 3 ng&agrave;y, T&acirc;y Ninh c&oacute; 9 người ngộ độc nghi do ăn nấm rừng</a><a href=\"https://tuoitre.vn/trong-ba-ngay-tay-ninh-co-chin-nguoi-ngo-doc-nghi-do-an-nam-rung-20230609121803143.htm\" target=\"_blank\">ĐỌC NGAY</a></span></h4>\r\n	</li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:14px\">Trước đ&oacute;, v&agrave;o ng&agrave;y 6-6, Bệnh viện Chợ Rẫy tiếp nhận ba trường hợp trong một gia đ&igrave;nh bị&nbsp;<a href=\"https://tuoitre.vn/ngo-doc-nam.html\" target=\"_blank\" title=\"ngộ độc nấm\">ngộ độc nấm</a>. Người chồng c&oacute; t&igrave;nh trạng kh&oacute; thở, suy h&ocirc; hấp, được đặt nội kh&iacute; quản, b&oacute;p b&oacute;ng nhưng do ngộ độc qu&aacute; nặng n&ecirc;n đ&atilde; tử vong tại khoa cấp cứu.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Người vợ v&agrave; con g&aacute;i được chuyển l&ecirc;n khoa bệnh nhiệt đới trong t&igrave;nh trạng suy gan cấp, men gan rất cao k&egrave;m theo rối loạn đ&ocirc;ng m&aacute;u.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Sau hai ng&agrave;y điều trị, người con 17 tuổi c&oacute; cải thiện. Ri&ecirc;ng người vợ vẫn đang nguy kịch, rối loạn chức năng gan vẫn diễn tiến xấu, c&aacute;c b&aacute;c sĩ thực hiện c&aacute;c biện ph&aacute;p hồi sức như lọc m&aacute;u, điều trị hỗ trợ gan.</span></p>\r\n', '2023-06-12 15:14:50', 3),
(7, 6, 'Thời trang Việt vươn tầm thế giới', 'op-1686455241786601524956.jpg', '<p><span style=\"font-size:14px\">Giới mộ điệu thời trang Việt Nam như vỡ &ograve;a khi bắt gặp Phạm Băng Băng diện thiết kế của Chung Thanh Phong tr&ecirc;n thảm đỏ&nbsp;<a href=\"https://tuoitre.vn/lien-hoan-phim-cannes.html\" target=\"_blank\" title=\"Liên hoan phim Cannes\">Li&ecirc;n hoan phim Cannes</a>&nbsp;2023.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Trước nữ diễn vi&ecirc;n Trung Quốc n&agrave;y, c&aacute;c ng&ocirc;i sao quốc tế cũng từng chọn thiết kế của Nguyễn C&ocirc;ng Tr&iacute;, L&ecirc; Thanh H&ograve;a, Chung Thanh Phong, Nguyễn Minh Tuấn&hellip; khi dự sự kiện quan trọng, đi thảm đỏ, quay h&igrave;nh sản phẩm&hellip;</span></p>\r\n\r\n<h2><span style=\"font-size:14px\">&quot;C&aacute;nh bướm&quot; của Chung Thanh Phong</span></h2>\r\n\r\n<p><span style=\"font-size:14px\">Hai thiết kế Phạm Băng Băng mặc tại Cannes l&agrave; thiết kế mới nhất của Chung Thanh Phong trong bộ sưu tập tr&igrave;nh diễn tại Ph&uacute; Quốc vừa qua.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">&quot;Phong rất may mắn khi mẫu thiết kế của m&igrave;nh lọt v&agrave;o mắt xanh của Phạm Băng Băng v&agrave; stylist của c&ocirc;. Stylist của Phạm Băng Băng đ&atilde; li&ecirc;n hệ trực tiếp với Phong qua Instagram sau s&ocirc; diễn một tuần&quot; - Chung Thanh Phong n&oacute;i với Tuổi Trẻ.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Chung Thanh Phong cho biết mẫu thiết kế Phạm Băng Băng chọn cũng được nhiều sao Hollywood y&ecirc;u th&iacute;ch nhưng sản phẩm l&agrave; phi&ecirc;n bản giới hạn chỉ c&oacute; một. Phạm Băng Băng l&agrave; người đầu ti&ecirc;n lựa chọn n&ecirc;n nh&agrave; thiết kế ưu ti&ecirc;n d&agrave;nh cho c&ocirc; hai thiết kế. Anh mất hơn 20 ng&agrave;y để chỉnh sửa, ho&agrave;n thiện lại thiết kế theo số đo của Phạm Băng Băng.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Thiết kế lần n&agrave;y được anh lấy cảm hứng từ c&aacute;nh bướm nhưng ph&aacute; c&aacute;ch, d&ugrave;ng chất liệu bắt s&aacute;ng. Trước đ&oacute;, mẫu thiết kế từ c&aacute;nh bướm d&agrave;nh cho hoa hậu Ngọc Ch&acirc;u,&nbsp;<a href=\"https://tuoitre.vn/hoa-hau-chuyen-gioi.html\" target=\"_blank\" title=\"hoa hậu chuyển giới\">hoa hậu chuyển giới</a>&nbsp;Tr&acirc;n Đ&agrave;i cũng tạo được dấu ấn với 18 triệu lượt xem.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Trong những năm qua, Chung Thanh Phong li&ecirc;n tục cho ra những sản phẩm lấy cảm hứng từ c&aacute;nh bướm. H&igrave;nh tượng n&agrave;y cũng được c&aacute;c nh&agrave; mốt lớn tr&ecirc;n thế giới quan t&acirc;m, đưa v&agrave;o thiết kế. Điều n&agrave;y minh chứng cho sự kh&aacute;c biệt trong thời trang mang đến sự ch&uacute; &yacute; v&agrave; tiếng vang trong nước v&agrave; quốc tế.</span></p>\r\n\r\n<h2><span style=\"font-size:14px\">Vị thế thời trang Việt</span></h2>\r\n\r\n<p><span style=\"font-size:14px\">Trước đ&oacute; nhiều ng&ocirc;i sao quốc tế đ&atilde; chọn trang phục của nh&agrave; thiết kế L&ecirc; Thanh H&ograve;a khi tham dự c&aacute;c sự kiện quan trọng như Miranda Lambert, Jeannie Mai, Bella Thorne, Sevyn Streeter, Janelle Mon&aacute;e, Paris Hilton, Halle Bailey&hellip;</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Trong đ&oacute; Miranda Lambert đặt L&ecirc; Thanh H&ograve;a thiết kế ri&ecirc;ng theo số đo của c&ocirc; trang phục dự&nbsp;<a href=\"https://tuoitre.vn/le-trao-giai-grammy.html\" target=\"_blank\" title=\"lễ trao giải Grammy\">lễ trao giải Grammy</a>&nbsp;lần thứ 65 tại Mỹ v&agrave;o đầu năm 2023. Thiết kế n&agrave;y được anh ph&aacute;t triển từ bộ sưu tập Sa Vũ. Cũng tại Grammy 2023, Jordan Chiles xuất hiện với chiếc v&aacute;y ứng dụng kỹ thuật đ&iacute;nh kết đ&aacute; v&agrave; l&ocirc;ng vũ ấn tượng.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Bella Thorne quyến rũ trong chiếc v&aacute;y &ocirc;m body c&oacute; họa tiết độc lạ, phong c&aacute;ch quyến rũ tại Li&ecirc;n hoan phim Sundance 2023. B&agrave; Janet Yang - chủ tịch Viện Phim Hoa Kỳ - cũng chọn thiết kế của L&ecirc; Thanh H&ograve;a khi đi thảm đỏ lễ&nbsp;<a href=\"https://tuoitre.vn/trao-giai-oscar.html\" target=\"_blank\" title=\"trao giải Oscar\">trao giải Oscar</a>&nbsp;lần thứ 95.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">&quot;Như một giấc mơ đ&atilde; th&agrave;nh sự thật, H&ograve;a vỡ &ograve;a khi thấy một thiết kế của m&igrave;nh xuất hiện tr&ecirc;n thảm đỏ Oscar danh gi&aacute;&quot; - L&ecirc; Thanh H&ograve;a chia sẻ.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Để c&oacute; được quả ngọt n&agrave;y l&agrave; cả một qu&aacute; tr&igrave;nh phấn đấu v&agrave; minh chứng cho sự s&aacute;ng tạo kh&ocirc;ng ngừng, cho ra những thiết kế mang m&agrave;u sắc ri&ecirc;ng của nh&agrave; thiết kế. Giấc mơ mang thời trang Việt ra quốc tế vẫn đau đ&aacute;u trong anh v&agrave; tiếp tục được anh thực hiện.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Chung Thanh Phong cũng từng thiết kế trang phục cho hầu hết c&aacute;c đương kim hoa hậu của Miss Universe, Miss World. Phạm Băng Băng cũng đ&atilde; đặt h&agrave;ng ri&ecirc;ng anh v&agrave;i mẫu thiết kế kh&aacute;c.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Ngo&agrave;i ra anh cũng nhận lời mời từ stylist của c&aacute;c&nbsp;<a href=\"https://tuoitre.vn/ngoi-sao-hollywood.html\" target=\"_blank\" title=\"ngôi sao Hollywood\">ng&ocirc;i sao Hollywood</a>&nbsp;về thiết kế trang phục, sẽ cho ra mắt trong thời gian tới. &quot;Đứng vững tại thị trường Việt Nam, t&igrave;m kiếm cơ hội mang sản phẩm ra nước ngo&agrave;i, dự kiến năm sau tổ chức s&ocirc; diễn ở quốc tế&quot; - Chung Thanh Phong mong ước.</span></p>\r\n', '2023-06-12 15:14:50', 3),
(8, 2, 'Thanh tra Chính phủ kỷ luật 1 phó cục trưởng, 5 thanh tra viên', 'thanh-tra-cp-16865619188421978092945.jpg', '<p><span style=\"font-size:14px\">Theo quyết định của Thanh tra Ch&iacute;nh phủ, &ocirc;ng L&ecirc; Quốc Khanh - ph&oacute; cục trưởng Cục Thanh tra, Giải quyết khiếu nại, tố c&aacute;o khu vực II (Cục II) - bị kỷ luật bằng h&igrave;nh thức buộc th&ocirc;i việc, do suy tho&aacute;i về tư tưởng ch&iacute;nh trị, đạo đức, lối sống, vi phạm ph&aacute;p luật đến mức phải truy cứu tr&aacute;ch nhiệm h&igrave;nh sự.&nbsp;</span></p>\r\n\r\n<p><span style=\"font-size:14px\">&Ocirc;ng L&ecirc; Quốc Khanh cũng vi phạm quy định về ph&ograve;ng, chống tham nhũng, ti&ecirc;u cực, g&acirc;y hậu quả rất nghi&ecirc;m trọng, ảnh hưởng xấu đến uy t&iacute;n của cơ quan&nbsp;<a href=\"https://tuoitre.vn/thanh-tra-chinh-phu.html\" title=\"Thanh tra Chính phủ\">Thanh tra Ch&iacute;nh phủ</a>.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">B&ecirc;n cạnh đ&oacute;, 5 c&ocirc;ng chức kh&aacute;c cũng bị buộc th&ocirc;i việc, gồm: &ocirc;ng Nguyễn Nho Định - thanh tra vi&ecirc;n Cục II; &ocirc;ng Ho&agrave;ng Văn Xu&acirc;n - thanh tra vi&ecirc;n ch&iacute;nh Cục II; &ocirc;ng Trần Văn Tuấn - thanh tra vi&ecirc;n cao cấp Vụ Thanh tra, Giải quyết khiếu nại, tố c&aacute;o khối nội ch&iacute;nh v&agrave; kinh tế tổng hợp (Vụ II); &ocirc;ng Trương Việt Hưng - thanh tra vi&ecirc;n ch&iacute;nh Vụ II v&agrave; &ocirc;ng Nguyễn Duy Phương - thanh tra vi&ecirc;n ch&iacute;nh Vụ II.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Nguy&ecirc;n nh&acirc;n 5 c&aacute;n bộ tr&ecirc;n của Thanh tra Ch&iacute;nh phủ bị buộc th&ocirc;i việc l&agrave; do suy tho&aacute;i về tư tưởng ch&iacute;nh trị, đạo đức, lối sống.&nbsp;</span></p>\r\n\r\n<p><span style=\"font-size:14px\">C&aacute;c c&aacute;n bộ n&agrave;y đ&atilde; c&oacute; những vi phạm đến mức phải truy cứu tr&aacute;ch nhiệm h&igrave;nh sự, vi phạm quy định về ph&ograve;ng, chống tham nhũng, ti&ecirc;u cực, g&acirc;y hậu quả rất nghi&ecirc;m trọng, ảnh hưởng xấu đến uy t&iacute;n của cơ quan Thanh tra Ch&iacute;nh phủ.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Cục Thanh tra, Giải quyết khiếu nại, tố c&aacute;o khu vực 2 (Cục II) c&oacute; chức năng gi&uacute;p tổng Thanh tra Ch&iacute;nh phủ thực hiện c&ocirc;ng t&aacute;c quản l&yacute; nh&agrave; nước v&agrave; trực tiếp thanh tra, giải quyết khiếu nại, tố c&aacute;o ở địa phương gồm: Thanh H&oacute;a, Nghệ An, H&agrave; Tĩnh, Quảng B&igrave;nh, Quảng Trị, Thừa Thi&ecirc;n Huế, Đ&agrave; Nẵng, Quảng Nam, Quảng Ng&atilde;i, B&igrave;nh Định, Ph&uacute; Y&ecirc;n, L&acirc;m Đồng, Kon Tum, Gia Lai, Đắk Lắk, Đắk N&ocirc;ng, Kh&aacute;nh H&ograve;a, Ninh Thuận.</span></p>\r\n', '2023-06-12 15:14:50', 3),
(9, 5, 'Uruguay vô địch World Cup U20 2023', '2023-06-04t231957z1985050.jpg', '<h2><span style=\"font-size:14px\">Với chiến thắng 1-0 trước U20 &Yacute; ở chung kết s&aacute;ng 12-6, tuyển U20 Uruguay đ&atilde; đăng quang chức v&ocirc; địch World Cup U20 2023.</span></h2>\r\n\r\n<p><span style=\"font-size:14px\"><a href=\"https://cdn.tuoitre.vn/471584752817336320/2023/6/12/2023-06-04t231847z606671957up1ej641sr9rlrtrmadp3soccer-worldcupu20-usa-ury-report-16865313147901852195919.jpg\" rel=\"nofollow\" target=\"_blank\"><img alt=\"Uruguay vô địch World Cup U20 2023 - Ảnh 1.\" id=\"img_592518076962021376\" src=\"https://cdn.tuoitre.vn/thumb_w/730/471584752817336320/2023/6/12/2023-06-04t231847z606671957up1ej641sr9rlrtrmadp3soccer-worldcupu20-usa-ury-report-16865313147901852195919.jpg\" title=\"Uruguay vô địch World Cup U20 2023 - Ảnh 1.\" /></a></span></p>\r\n\r\n<p><span style=\"font-size:14px\">Tuyển U20 Uruguay đ&atilde; đăng quang chức v&ocirc; địch World Cup U20 2023 - Ảnh: Reuters</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Đ&acirc;y l&agrave; trận đấu m&agrave;&nbsp;<a href=\"https://tuoitre.vn/hlv-oscar-tabarez-bi-sa-thai-sau-15-nam-dan-dat-doi-tuyen-uruguay-20211120171953302.htm\" title=\"Uruguay\">Uruguay</a>&nbsp;đ&atilde; chơi &aacute;p đảo ho&agrave;n to&agrave;n v&agrave; tạo ra rất nhiều cơ hội ghi b&agrave;n. Tuy nhi&ecirc;n h&agrave;ng thủ của U20 &Yacute; đ&atilde; chơi rất chắc chắn để đứng vững trước sự tấn c&ocirc;ng dồn dập của đối thủ đến từ Nam Mỹ.&nbsp;</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Ph&uacute;t 81, &Yacute; nhận tr&aacute;i đắng khi Matteo Prati bị r&uacute;t thẻ đỏ truất quyền thi đấu v&igrave; pha phạm lỗi với đối thủ. Nhưng sau khi xem VAR, trọng t&agrave;i đ&atilde; thay đổi quyết định gi&uacute;p &Yacute; vẫn c&ograve;n đủ người tr&ecirc;n s&acirc;n.&nbsp;</span></p>\r\n\r\n<ul>\r\n	<li>\r\n	<h4><span style=\"font-size:14px\"><a href=\"https://tuoitre.vn/thua-soc-truoc-nigeria-u20-argentina-bi-loai-20230601061933688.htm\" target=\"_blank\">Thua sốc trước Nigeria, U20 Argentina bị loại</a></span></h4>\r\n	</li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:14px\">Tuy nhi&ecirc;n niềm vui của người &Yacute; đ&atilde; nhanh ch&oacute;ng bị dập tắt sau đ&oacute; 5 ph&uacute;t.&nbsp;</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Ph&uacute;t 86, Uruguay ghi được b&agrave;n thắng mở tỉ số 1-0 do c&ocirc;ng của tiền đạo Luciano Rodr&iacute;guez với pha đ&aacute;nh đầu chuẩn x&aacute;c sau t&igrave;nh huống đ&aacute; phạt g&oacute;c.&nbsp;</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Tỉ số n&agrave;y được giữ nguy&ecirc;n cho đến hết trận v&agrave; Uruguay đ&atilde; đăng quang chức v&ocirc; địch một c&aacute;ch xứng đ&aacute;ng. Đ&acirc;y l&agrave; lần đầu ti&ecirc;n trong lịch sử Uruguay l&ecirc;n ng&ocirc;i ở&nbsp;<a href=\"https://tuoitre.vn/u20-world-cup.html\" target=\"_blank\" title=\"World Cup U20\">World Cup U20</a>.</span></p>\r\n\r\n<p><span style=\"font-size:14px\">D&ugrave; U20 &Yacute; kh&ocirc;ng gi&agrave;nh được chức v&ocirc; địch nhưng cầu thủ của họ đ&atilde; gi&agrave;nh được tất cả ba danh hiệu c&aacute; nh&acirc;n l&agrave; cầu thủ xuất sắc nhất (Cesare Casadei), Vua ph&aacute; lưới (Cesare Casadei, 7 b&agrave;n thắng) v&agrave; thủ m&ocirc;n xuất sắc nhất (Sebastiano Desplanches).&nbsp;</span></p>\r\n\r\n<p><span style=\"font-size:14px\">Trong khi đ&oacute;, đại diện của ch&acirc;u &Aacute; l&agrave;&nbsp;<a href=\"https://tuoitre.vn/han-quoc-israel-vao-ban-ket-world-cup-u20-20230605041451043.htm\" target=\"_blank\" title=\"U20 Hàn Quốc\">U20 H&agrave;n Quốc</a>&nbsp;đ&atilde; kh&ocirc;ng thể gi&agrave;nh được huy chương đồng sau khi thất bại 1-3 trước U20 Israel.</span></p>\r\n', '2023-06-12 15:14:50', 3);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lien_ket_02` (`tintuc_id`),
  ADD KEY `lien_ket_03` (`nguoidung_id`);

--
-- Chỉ mục cho bảng `chude`
--
ALTER TABLE `chude`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `gopy`
--
ALTER TABLE `gopy`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tintuc`
--
ALTER TABLE `tintuc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lien_ket_01` (`chude_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `chude`
--
ALTER TABLE `chude`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `gopy`
--
ALTER TABLE `gopy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tintuc`
--
ALTER TABLE `tintuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `lien_ket_02` FOREIGN KEY (`tintuc_id`) REFERENCES `tintuc` (`id`),
  ADD CONSTRAINT `lien_ket_03` FOREIGN KEY (`nguoidung_id`) REFERENCES `nguoidung` (`id`);

--
-- Các ràng buộc cho bảng `tintuc`
--
ALTER TABLE `tintuc`
  ADD CONSTRAINT `lien_ket_01` FOREIGN KEY (`chude_id`) REFERENCES `chude` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
