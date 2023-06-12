-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 12, 2023 lúc 12:06 PM
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

--
-- Đang đổ dữ liệu cho bảng `binhluan`
--

INSERT INTO `binhluan` (`id`, `tintuc_id`, `nguoidung_id`, `noidung`, `ngay`) VALUES
(1, 8, 1, 'bài viết ok', '2023-06-12 16:15:51'),
(2, 8, 1, 'ok đấy\r\n', '2023-06-12 16:16:03');

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
(4, 4, 'Giá xăng giữ nguyên, dầu tăng nhẹ', 'gia-xang-16865536441451116152520-0-0-776-1242-crop-1686553648935662662516.jpg', '<h2>Gi&aacute; xăng được giữ nguy&ecirc;n trong khi gi&aacute; dầu điều chỉnh tăng nhẹ kể từ 15h chiều nay (12-6) theo c&aacute;c doanh nghiệp kinh doanh xăng dầu.</h2>\r\n\r\n<p>C&aacute;c mặt h&agrave;ng xăng dầu giữ nguy&ecirc;n mức gi&aacute; như kỳ trước. Cụ thể, xăng E5RON92 c&oacute; gi&aacute; 20.870 đồng/l&iacute;t; xăng RON95-III c&oacute; gi&aacute; 22.010 đồng/l&iacute;t.</p>\r\n\r\n<p>Trong khi đ&oacute;, c&aacute;c mặt h&agrave;ng dầu đa phần tăng nhẹ, trừ dầu mazut 180CST 3.5S. Cụ thể, với&nbsp;<a href=\"https://tuoitre.vn/chieu-nay-11-5-gia-xang-giam-1-300-dong-lit-2023051114162748.htm\" title=\"dầu diesel\">dầu diesel</a>&nbsp;0.05S c&oacute; gi&aacute; 18.028 đồng/l&iacute;t, tăng 85 đồng/l&iacute;t; dầu hỏa c&oacute; mức gi&aacute; 17.823 đồng/l&iacute;t, tăng 52 đồng/l&iacute;t; dầu mazut 180CST 3.5S c&oacute; mức gi&aacute; 14.719 đồng/kg, giảm 164 đồng/kg so với gi&aacute; b&aacute;n lẻ hiện h&agrave;nh.</p>\r\n\r\n<p>Ở kỳ điều h&agrave;nh n&agrave;y, cơ quan quản l&yacute; thay đổi mức tr&iacute;ch lập với c&aacute;c mặt h&agrave;ng xăng dầu. Cụ thể, thực hiện tr&iacute;ch lập quỹ b&igrave;nh ổn gi&aacute; đối với mặt h&agrave;ng xăng E5RON92 ở mức 228 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t), xăng RON95 ở mức 180 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t).</p>\r\n\r\n<p>Với mặt h&agrave;ng dầu, mức tr&iacute;ch lập cho dầu diesel ở mức 200 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t); dầu hỏa ở mức 200 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t); dầu mazut ở mức 100 đồng/kg (kỳ trước 300 đồng/kg). Đồng thời,&nbsp;<a href=\"https://tuoitre.vn/quy-binh-on-gia-xang-dau-hien-giao-doanh-nghiep-quan-la-khong-hop-ly-20230406105235064.htm\" title=\"quỹ bình ổn xăng dầu\">quỹ b&igrave;nh ổn xăng dầu</a>&nbsp;kh&ocirc;ng d&ugrave;ng với tất cả mặt h&agrave;ng xăng, dầu.</p>\r\n\r\n<p><a href=\"https://tuoitre.vn/de-nghi-danh-gia-lai-hieu-qua-cua-quy-binh-on-gia-xang-dau-20230327113553442.htm\" target=\"_blank\"><img alt=\"Đề nghị đánh giá lại hiệu quả của Quỹ bình ổn giá xăng dầu\" src=\"https://cdn.tuoitre.vn/471584752817336320/2023/3/27/xangdau-1679891361449748121820-31-0-487-730-crop-16798913737592061094496.jpeg\" /></a></p>\r\n\r\n<p>Cơ quan quản l&yacute; cho hay kỳ điều h&agrave;nh lần n&agrave;y, thị trường&nbsp;<a href=\"https://tuoitre.vn/chinh-phu-chi-dao-xem-xet-de-xuat-hoan-tra-chi-phi-loi-nhuan-cho-ban-le-xang-dau-20230417143629118.htm\" title=\"xăng dầu\">xăng dầu</a>&nbsp;thế giới chịu ảnh hưởng của c&aacute;c yếu tố như: dự b&aacute;o nhu cầu dầu th&ocirc; to&agrave;n cầu tiếp tục sẽ tăng trong năm nay do nhu cầu của Trung Quốc v&agrave; ảnh hưởng từ c&aacute;c động th&aacute;i cắt giảm sản lượng của OPEC+.</p>\r\n\r\n<p>Như vậy&nbsp;<a href=\"https://tuoitre.vn/gia-xang.html\" title=\"giá xăng \">gi&aacute; xăng&nbsp;</a>đ&atilde; được giữ nguy&ecirc;n sau khi tăng hai lần li&ecirc;n tiếp. D&ugrave; tăng nhưng gi&aacute; nhi&ecirc;n liệu n&agrave;y đang ở mức thấp trong v&ograve;ng 20 th&aacute;ng.</p>\r\n\r\n<p>T&iacute;nh cả lần n&agrave;y, từ đầu năm, gi&aacute; xăng dầu đ&atilde; trải qua 17 lần điều chỉnh gi&aacute;. Trong đ&oacute; t&aacute;m lần tăng, s&aacute;u lần giảm v&agrave; ba lần giữ nguy&ecirc;n.</p>\r\n', '2023-06-12 15:14:50', 3),
(5, 1, 'Giá xăng giữ nguyên, dầu tăng nhẹ', 'gia-xang-16865536441451116152520-0-0-776-1242-crop-1686553648935662662516.jpg', '<h2>Gi&aacute; xăng được giữ nguy&ecirc;n trong khi gi&aacute; dầu điều chỉnh tăng nhẹ kể từ 15h chiều nay (12-6) theo c&aacute;c doanh nghiệp kinh doanh xăng dầu.</h2>\r\n\r\n<p>C&aacute;c mặt h&agrave;ng xăng dầu giữ nguy&ecirc;n mức gi&aacute; như kỳ trước. Cụ thể, xăng E5RON92 c&oacute; gi&aacute; 20.870 đồng/l&iacute;t; xăng RON95-III c&oacute; gi&aacute; 22.010 đồng/l&iacute;t.</p>\r\n\r\n<p>Trong khi đ&oacute;, c&aacute;c mặt h&agrave;ng dầu đa phần tăng nhẹ, trừ dầu mazut 180CST 3.5S. Cụ thể, với&nbsp;<a href=\"https://tuoitre.vn/chieu-nay-11-5-gia-xang-giam-1-300-dong-lit-2023051114162748.htm\" title=\"dầu diesel\">dầu diesel</a>&nbsp;0.05S c&oacute; gi&aacute; 18.028 đồng/l&iacute;t, tăng 85 đồng/l&iacute;t; dầu hỏa c&oacute; mức gi&aacute; 17.823 đồng/l&iacute;t, tăng 52 đồng/l&iacute;t; dầu mazut 180CST 3.5S c&oacute; mức gi&aacute; 14.719 đồng/kg, giảm 164 đồng/kg so với gi&aacute; b&aacute;n lẻ hiện h&agrave;nh.</p>\r\n\r\n<p>Ở kỳ điều h&agrave;nh n&agrave;y, cơ quan quản l&yacute; thay đổi mức tr&iacute;ch lập với c&aacute;c mặt h&agrave;ng xăng dầu. Cụ thể, thực hiện tr&iacute;ch lập quỹ b&igrave;nh ổn gi&aacute; đối với mặt h&agrave;ng xăng E5RON92 ở mức 228 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t), xăng RON95 ở mức 180 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t).</p>\r\n\r\n<p>Với mặt h&agrave;ng dầu, mức tr&iacute;ch lập cho dầu diesel ở mức 200 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t); dầu hỏa ở mức 200 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t); dầu mazut ở mức 100 đồng/kg (kỳ trước 300 đồng/kg). Đồng thời,&nbsp;<a href=\"https://tuoitre.vn/quy-binh-on-gia-xang-dau-hien-giao-doanh-nghiep-quan-la-khong-hop-ly-20230406105235064.htm\" title=\"quỹ bình ổn xăng dầu\">quỹ b&igrave;nh ổn xăng dầu</a>&nbsp;kh&ocirc;ng d&ugrave;ng với tất cả mặt h&agrave;ng xăng, dầu.</p>\r\n\r\n<p><a href=\"https://tuoitre.vn/de-nghi-danh-gia-lai-hieu-qua-cua-quy-binh-on-gia-xang-dau-20230327113553442.htm\" target=\"_blank\"><img alt=\"Đề nghị đánh giá lại hiệu quả của Quỹ bình ổn giá xăng dầu\" src=\"https://cdn.tuoitre.vn/471584752817336320/2023/3/27/xangdau-1679891361449748121820-31-0-487-730-crop-16798913737592061094496.jpeg\" /></a></p>\r\n\r\n<p>Cơ quan quản l&yacute; cho hay kỳ điều h&agrave;nh lần n&agrave;y, thị trường&nbsp;<a href=\"https://tuoitre.vn/chinh-phu-chi-dao-xem-xet-de-xuat-hoan-tra-chi-phi-loi-nhuan-cho-ban-le-xang-dau-20230417143629118.htm\" title=\"xăng dầu\">xăng dầu</a>&nbsp;thế giới chịu ảnh hưởng của c&aacute;c yếu tố như: dự b&aacute;o nhu cầu dầu th&ocirc; to&agrave;n cầu tiếp tục sẽ tăng trong năm nay do nhu cầu của Trung Quốc v&agrave; ảnh hưởng từ c&aacute;c động th&aacute;i cắt giảm sản lượng của OPEC+.</p>\r\n\r\n<p>Như vậy&nbsp;<a href=\"https://tuoitre.vn/gia-xang.html\" title=\"giá xăng \">gi&aacute; xăng&nbsp;</a>đ&atilde; được giữ nguy&ecirc;n sau khi tăng hai lần li&ecirc;n tiếp. D&ugrave; tăng nhưng gi&aacute; nhi&ecirc;n liệu n&agrave;y đang ở mức thấp trong v&ograve;ng 20 th&aacute;ng.</p>\r\n\r\n<p>T&iacute;nh cả lần n&agrave;y, từ đầu năm, gi&aacute; xăng dầu đ&atilde; trải qua 17 lần điều chỉnh gi&aacute;. Trong đ&oacute; t&aacute;m lần tăng, s&aacute;u lần giảm v&agrave; ba lần giữ nguy&ecirc;n.</p>\r\n', '2023-06-12 15:14:50', 3),
(6, 2, 'Giá xăng giữ nguyên, dầu tăng nhẹ', 'gia-xang-16865536441451116152520-0-0-776-1242-crop-1686553648935662662516.jpg', '<h2>Gi&aacute; xăng được giữ nguy&ecirc;n trong khi gi&aacute; dầu điều chỉnh tăng nhẹ kể từ 15h chiều nay (12-6) theo c&aacute;c doanh nghiệp kinh doanh xăng dầu.</h2>\r\n\r\n<p>C&aacute;c mặt h&agrave;ng xăng dầu giữ nguy&ecirc;n mức gi&aacute; như kỳ trước. Cụ thể, xăng E5RON92 c&oacute; gi&aacute; 20.870 đồng/l&iacute;t; xăng RON95-III c&oacute; gi&aacute; 22.010 đồng/l&iacute;t.</p>\r\n\r\n<p>Trong khi đ&oacute;, c&aacute;c mặt h&agrave;ng dầu đa phần tăng nhẹ, trừ dầu mazut 180CST 3.5S. Cụ thể, với&nbsp;<a href=\"https://tuoitre.vn/chieu-nay-11-5-gia-xang-giam-1-300-dong-lit-2023051114162748.htm\" title=\"dầu diesel\">dầu diesel</a>&nbsp;0.05S c&oacute; gi&aacute; 18.028 đồng/l&iacute;t, tăng 85 đồng/l&iacute;t; dầu hỏa c&oacute; mức gi&aacute; 17.823 đồng/l&iacute;t, tăng 52 đồng/l&iacute;t; dầu mazut 180CST 3.5S c&oacute; mức gi&aacute; 14.719 đồng/kg, giảm 164 đồng/kg so với gi&aacute; b&aacute;n lẻ hiện h&agrave;nh.</p>\r\n\r\n<p>Ở kỳ điều h&agrave;nh n&agrave;y, cơ quan quản l&yacute; thay đổi mức tr&iacute;ch lập với c&aacute;c mặt h&agrave;ng xăng dầu. Cụ thể, thực hiện tr&iacute;ch lập quỹ b&igrave;nh ổn gi&aacute; đối với mặt h&agrave;ng xăng E5RON92 ở mức 228 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t), xăng RON95 ở mức 180 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t).</p>\r\n\r\n<p>Với mặt h&agrave;ng dầu, mức tr&iacute;ch lập cho dầu diesel ở mức 200 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t); dầu hỏa ở mức 200 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t); dầu mazut ở mức 100 đồng/kg (kỳ trước 300 đồng/kg). Đồng thời,&nbsp;<a href=\"https://tuoitre.vn/quy-binh-on-gia-xang-dau-hien-giao-doanh-nghiep-quan-la-khong-hop-ly-20230406105235064.htm\" title=\"quỹ bình ổn xăng dầu\">quỹ b&igrave;nh ổn xăng dầu</a>&nbsp;kh&ocirc;ng d&ugrave;ng với tất cả mặt h&agrave;ng xăng, dầu.</p>\r\n\r\n<p><a href=\"https://tuoitre.vn/de-nghi-danh-gia-lai-hieu-qua-cua-quy-binh-on-gia-xang-dau-20230327113553442.htm\" target=\"_blank\"><img alt=\"Đề nghị đánh giá lại hiệu quả của Quỹ bình ổn giá xăng dầu\" src=\"https://cdn.tuoitre.vn/471584752817336320/2023/3/27/xangdau-1679891361449748121820-31-0-487-730-crop-16798913737592061094496.jpeg\" /></a></p>\r\n\r\n<p>Cơ quan quản l&yacute; cho hay kỳ điều h&agrave;nh lần n&agrave;y, thị trường&nbsp;<a href=\"https://tuoitre.vn/chinh-phu-chi-dao-xem-xet-de-xuat-hoan-tra-chi-phi-loi-nhuan-cho-ban-le-xang-dau-20230417143629118.htm\" title=\"xăng dầu\">xăng dầu</a>&nbsp;thế giới chịu ảnh hưởng của c&aacute;c yếu tố như: dự b&aacute;o nhu cầu dầu th&ocirc; to&agrave;n cầu tiếp tục sẽ tăng trong năm nay do nhu cầu của Trung Quốc v&agrave; ảnh hưởng từ c&aacute;c động th&aacute;i cắt giảm sản lượng của OPEC+.</p>\r\n\r\n<p>Như vậy&nbsp;<a href=\"https://tuoitre.vn/gia-xang.html\" title=\"giá xăng \">gi&aacute; xăng&nbsp;</a>đ&atilde; được giữ nguy&ecirc;n sau khi tăng hai lần li&ecirc;n tiếp. D&ugrave; tăng nhưng gi&aacute; nhi&ecirc;n liệu n&agrave;y đang ở mức thấp trong v&ograve;ng 20 th&aacute;ng.</p>\r\n\r\n<p>T&iacute;nh cả lần n&agrave;y, từ đầu năm, gi&aacute; xăng dầu đ&atilde; trải qua 17 lần điều chỉnh gi&aacute;. Trong đ&oacute; t&aacute;m lần tăng, s&aacute;u lần giảm v&agrave; ba lần giữ nguy&ecirc;n.</p>\r\n', '2023-06-12 15:14:50', 3),
(7, 2, 'Giá xăng giữ nguyên, dầu tăng nhẹ', 'gia-xang-16865536441451116152520-0-0-776-1242-crop-1686553648935662662516.jpg', '<h2>Gi&aacute; xăng được giữ nguy&ecirc;n trong khi gi&aacute; dầu điều chỉnh tăng nhẹ kể từ 15h chiều nay (12-6) theo c&aacute;c doanh nghiệp kinh doanh xăng dầu.</h2>\r\n\r\n<p>C&aacute;c mặt h&agrave;ng xăng dầu giữ nguy&ecirc;n mức gi&aacute; như kỳ trước. Cụ thể, xăng E5RON92 c&oacute; gi&aacute; 20.870 đồng/l&iacute;t; xăng RON95-III c&oacute; gi&aacute; 22.010 đồng/l&iacute;t.</p>\r\n\r\n<p>Trong khi đ&oacute;, c&aacute;c mặt h&agrave;ng dầu đa phần tăng nhẹ, trừ dầu mazut 180CST 3.5S. Cụ thể, với&nbsp;<a href=\"https://tuoitre.vn/chieu-nay-11-5-gia-xang-giam-1-300-dong-lit-2023051114162748.htm\" title=\"dầu diesel\">dầu diesel</a>&nbsp;0.05S c&oacute; gi&aacute; 18.028 đồng/l&iacute;t, tăng 85 đồng/l&iacute;t; dầu hỏa c&oacute; mức gi&aacute; 17.823 đồng/l&iacute;t, tăng 52 đồng/l&iacute;t; dầu mazut 180CST 3.5S c&oacute; mức gi&aacute; 14.719 đồng/kg, giảm 164 đồng/kg so với gi&aacute; b&aacute;n lẻ hiện h&agrave;nh.</p>\r\n\r\n<p>Ở kỳ điều h&agrave;nh n&agrave;y, cơ quan quản l&yacute; thay đổi mức tr&iacute;ch lập với c&aacute;c mặt h&agrave;ng xăng dầu. Cụ thể, thực hiện tr&iacute;ch lập quỹ b&igrave;nh ổn gi&aacute; đối với mặt h&agrave;ng xăng E5RON92 ở mức 228 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t), xăng RON95 ở mức 180 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t).</p>\r\n\r\n<p>Với mặt h&agrave;ng dầu, mức tr&iacute;ch lập cho dầu diesel ở mức 200 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t); dầu hỏa ở mức 200 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t); dầu mazut ở mức 100 đồng/kg (kỳ trước 300 đồng/kg). Đồng thời,&nbsp;<a href=\"https://tuoitre.vn/quy-binh-on-gia-xang-dau-hien-giao-doanh-nghiep-quan-la-khong-hop-ly-20230406105235064.htm\" title=\"quỹ bình ổn xăng dầu\">quỹ b&igrave;nh ổn xăng dầu</a>&nbsp;kh&ocirc;ng d&ugrave;ng với tất cả mặt h&agrave;ng xăng, dầu.</p>\r\n\r\n<p><a href=\"https://tuoitre.vn/de-nghi-danh-gia-lai-hieu-qua-cua-quy-binh-on-gia-xang-dau-20230327113553442.htm\" target=\"_blank\"><img alt=\"Đề nghị đánh giá lại hiệu quả của Quỹ bình ổn giá xăng dầu\" src=\"https://cdn.tuoitre.vn/471584752817336320/2023/3/27/xangdau-1679891361449748121820-31-0-487-730-crop-16798913737592061094496.jpeg\" /></a></p>\r\n\r\n<p>Cơ quan quản l&yacute; cho hay kỳ điều h&agrave;nh lần n&agrave;y, thị trường&nbsp;<a href=\"https://tuoitre.vn/chinh-phu-chi-dao-xem-xet-de-xuat-hoan-tra-chi-phi-loi-nhuan-cho-ban-le-xang-dau-20230417143629118.htm\" title=\"xăng dầu\">xăng dầu</a>&nbsp;thế giới chịu ảnh hưởng của c&aacute;c yếu tố như: dự b&aacute;o nhu cầu dầu th&ocirc; to&agrave;n cầu tiếp tục sẽ tăng trong năm nay do nhu cầu của Trung Quốc v&agrave; ảnh hưởng từ c&aacute;c động th&aacute;i cắt giảm sản lượng của OPEC+.</p>\r\n\r\n<p>Như vậy&nbsp;<a href=\"https://tuoitre.vn/gia-xang.html\" title=\"giá xăng \">gi&aacute; xăng&nbsp;</a>đ&atilde; được giữ nguy&ecirc;n sau khi tăng hai lần li&ecirc;n tiếp. D&ugrave; tăng nhưng gi&aacute; nhi&ecirc;n liệu n&agrave;y đang ở mức thấp trong v&ograve;ng 20 th&aacute;ng.</p>\r\n\r\n<p>T&iacute;nh cả lần n&agrave;y, từ đầu năm, gi&aacute; xăng dầu đ&atilde; trải qua 17 lần điều chỉnh gi&aacute;. Trong đ&oacute; t&aacute;m lần tăng, s&aacute;u lần giảm v&agrave; ba lần giữ nguy&ecirc;n.</p>\r\n', '2023-06-12 15:14:50', 3),
(8, 2, 'Giá xăng giữ nguyên, dầu tăng nhẹ', 'gia-xang-16865536441451116152520-0-0-776-1242-crop-1686553648935662662516.jpg', '<h2>Gi&aacute; xăng được giữ nguy&ecirc;n trong khi gi&aacute; dầu điều chỉnh tăng nhẹ kể từ 15h chiều nay (12-6) theo c&aacute;c doanh nghiệp kinh doanh xăng dầu.</h2>\r\n\r\n<p>C&aacute;c mặt h&agrave;ng xăng dầu giữ nguy&ecirc;n mức gi&aacute; như kỳ trước. Cụ thể, xăng E5RON92 c&oacute; gi&aacute; 20.870 đồng/l&iacute;t; xăng RON95-III c&oacute; gi&aacute; 22.010 đồng/l&iacute;t.</p>\r\n\r\n<p>Trong khi đ&oacute;, c&aacute;c mặt h&agrave;ng dầu đa phần tăng nhẹ, trừ dầu mazut 180CST 3.5S. Cụ thể, với&nbsp;<a href=\"https://tuoitre.vn/chieu-nay-11-5-gia-xang-giam-1-300-dong-lit-2023051114162748.htm\" title=\"dầu diesel\">dầu diesel</a>&nbsp;0.05S c&oacute; gi&aacute; 18.028 đồng/l&iacute;t, tăng 85 đồng/l&iacute;t; dầu hỏa c&oacute; mức gi&aacute; 17.823 đồng/l&iacute;t, tăng 52 đồng/l&iacute;t; dầu mazut 180CST 3.5S c&oacute; mức gi&aacute; 14.719 đồng/kg, giảm 164 đồng/kg so với gi&aacute; b&aacute;n lẻ hiện h&agrave;nh.</p>\r\n\r\n<p>Ở kỳ điều h&agrave;nh n&agrave;y, cơ quan quản l&yacute; thay đổi mức tr&iacute;ch lập với c&aacute;c mặt h&agrave;ng xăng dầu. Cụ thể, thực hiện tr&iacute;ch lập quỹ b&igrave;nh ổn gi&aacute; đối với mặt h&agrave;ng xăng E5RON92 ở mức 228 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t), xăng RON95 ở mức 180 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t).</p>\r\n\r\n<p>Với mặt h&agrave;ng dầu, mức tr&iacute;ch lập cho dầu diesel ở mức 200 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t); dầu hỏa ở mức 200 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t); dầu mazut ở mức 100 đồng/kg (kỳ trước 300 đồng/kg). Đồng thời,&nbsp;<a href=\"https://tuoitre.vn/quy-binh-on-gia-xang-dau-hien-giao-doanh-nghiep-quan-la-khong-hop-ly-20230406105235064.htm\" title=\"quỹ bình ổn xăng dầu\">quỹ b&igrave;nh ổn xăng dầu</a>&nbsp;kh&ocirc;ng d&ugrave;ng với tất cả mặt h&agrave;ng xăng, dầu.</p>\r\n\r\n<p><a href=\"https://tuoitre.vn/de-nghi-danh-gia-lai-hieu-qua-cua-quy-binh-on-gia-xang-dau-20230327113553442.htm\" target=\"_blank\"><img alt=\"Đề nghị đánh giá lại hiệu quả của Quỹ bình ổn giá xăng dầu\" src=\"https://cdn.tuoitre.vn/471584752817336320/2023/3/27/xangdau-1679891361449748121820-31-0-487-730-crop-16798913737592061094496.jpeg\" /></a></p>\r\n\r\n<p>Cơ quan quản l&yacute; cho hay kỳ điều h&agrave;nh lần n&agrave;y, thị trường&nbsp;<a href=\"https://tuoitre.vn/chinh-phu-chi-dao-xem-xet-de-xuat-hoan-tra-chi-phi-loi-nhuan-cho-ban-le-xang-dau-20230417143629118.htm\" title=\"xăng dầu\">xăng dầu</a>&nbsp;thế giới chịu ảnh hưởng của c&aacute;c yếu tố như: dự b&aacute;o nhu cầu dầu th&ocirc; to&agrave;n cầu tiếp tục sẽ tăng trong năm nay do nhu cầu của Trung Quốc v&agrave; ảnh hưởng từ c&aacute;c động th&aacute;i cắt giảm sản lượng của OPEC+.</p>\r\n\r\n<p>Như vậy&nbsp;<a href=\"https://tuoitre.vn/gia-xang.html\" title=\"giá xăng \">gi&aacute; xăng&nbsp;</a>đ&atilde; được giữ nguy&ecirc;n sau khi tăng hai lần li&ecirc;n tiếp. D&ugrave; tăng nhưng gi&aacute; nhi&ecirc;n liệu n&agrave;y đang ở mức thấp trong v&ograve;ng 20 th&aacute;ng.</p>\r\n\r\n<p>T&iacute;nh cả lần n&agrave;y, từ đầu năm, gi&aacute; xăng dầu đ&atilde; trải qua 17 lần điều chỉnh gi&aacute;. Trong đ&oacute; t&aacute;m lần tăng, s&aacute;u lần giảm v&agrave; ba lần giữ nguy&ecirc;n.</p>\r\n', '2023-06-12 15:14:50', 3),
(9, 2, 'nguyên nè', 'gia-xang-16865536441451116152520-0-0-776-1242-crop-1686553648935662662516.jpg', '<h2>Gi&aacute; xăng được giữ nguy&ecirc;n trong khi gi&aacute; dầu điều chỉnh tăng nhẹ kể từ 15h chiều nay (12-6) theo c&aacute;c doanh nghiệp kinh doanh xăng dầu.</h2>\r\n\r\n<p>C&aacute;c mặt h&agrave;ng xăng dầu giữ nguy&ecirc;n mức gi&aacute; như kỳ trước. Cụ thể, xăng E5RON92 c&oacute; gi&aacute; 20.870 đồng/l&iacute;t; xăng RON95-III c&oacute; gi&aacute; 22.010 đồng/l&iacute;t.</p>\r\n\r\n<p>Trong khi đ&oacute;, c&aacute;c mặt h&agrave;ng dầu đa phần tăng nhẹ, trừ dầu mazut 180CST 3.5S. Cụ thể, với&nbsp;<a href=\"https://tuoitre.vn/chieu-nay-11-5-gia-xang-giam-1-300-dong-lit-2023051114162748.htm\" title=\"dầu diesel\">dầu diesel</a>&nbsp;0.05S c&oacute; gi&aacute; 18.028 đồng/l&iacute;t, tăng 85 đồng/l&iacute;t; dầu hỏa c&oacute; mức gi&aacute; 17.823 đồng/l&iacute;t, tăng 52 đồng/l&iacute;t; dầu mazut 180CST 3.5S c&oacute; mức gi&aacute; 14.719 đồng/kg, giảm 164 đồng/kg so với gi&aacute; b&aacute;n lẻ hiện h&agrave;nh.</p>\r\n\r\n<p>Ở kỳ điều h&agrave;nh n&agrave;y, cơ quan quản l&yacute; thay đổi mức tr&iacute;ch lập với c&aacute;c mặt h&agrave;ng xăng dầu. Cụ thể, thực hiện tr&iacute;ch lập quỹ b&igrave;nh ổn gi&aacute; đối với mặt h&agrave;ng xăng E5RON92 ở mức 228 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t), xăng RON95 ở mức 180 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t).</p>\r\n\r\n<p>Với mặt h&agrave;ng dầu, mức tr&iacute;ch lập cho dầu diesel ở mức 200 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t); dầu hỏa ở mức 200 đồng/l&iacute;t (kỳ trước 300 đồng/l&iacute;t); dầu mazut ở mức 100 đồng/kg (kỳ trước 300 đồng/kg). Đồng thời,&nbsp;<a href=\"https://tuoitre.vn/quy-binh-on-gia-xang-dau-hien-giao-doanh-nghiep-quan-la-khong-hop-ly-20230406105235064.htm\" title=\"quỹ bình ổn xăng dầu\">quỹ b&igrave;nh ổn xăng dầu</a>&nbsp;kh&ocirc;ng d&ugrave;ng với tất cả mặt h&agrave;ng xăng, dầu.</p>\r\n\r\n<p><a href=\"https://tuoitre.vn/de-nghi-danh-gia-lai-hieu-qua-cua-quy-binh-on-gia-xang-dau-20230327113553442.htm\" target=\"_blank\"><img alt=\"Đề nghị đánh giá lại hiệu quả của Quỹ bình ổn giá xăng dầu\" src=\"https://cdn.tuoitre.vn/471584752817336320/2023/3/27/xangdau-1679891361449748121820-31-0-487-730-crop-16798913737592061094496.jpeg\" /></a></p>\r\n\r\n<p>Cơ quan quản l&yacute; cho hay kỳ điều h&agrave;nh lần n&agrave;y, thị trường&nbsp;<a href=\"https://tuoitre.vn/chinh-phu-chi-dao-xem-xet-de-xuat-hoan-tra-chi-phi-loi-nhuan-cho-ban-le-xang-dau-20230417143629118.htm\" title=\"xăng dầu\">xăng dầu</a>&nbsp;thế giới chịu ảnh hưởng của c&aacute;c yếu tố như: dự b&aacute;o nhu cầu dầu th&ocirc; to&agrave;n cầu tiếp tục sẽ tăng trong năm nay do nhu cầu của Trung Quốc v&agrave; ảnh hưởng từ c&aacute;c động th&aacute;i cắt giảm sản lượng của OPEC+.</p>\r\n\r\n<p>Như vậy&nbsp;<a href=\"https://tuoitre.vn/gia-xang.html\" title=\"giá xăng \">gi&aacute; xăng&nbsp;</a>đ&atilde; được giữ nguy&ecirc;n sau khi tăng hai lần li&ecirc;n tiếp. D&ugrave; tăng nhưng gi&aacute; nhi&ecirc;n liệu n&agrave;y đang ở mức thấp trong v&ograve;ng 20 th&aacute;ng.</p>\r\n\r\n<p>T&iacute;nh cả lần n&agrave;y, từ đầu năm, gi&aacute; xăng dầu đ&atilde; trải qua 17 lần điều chỉnh gi&aacute;. Trong đ&oacute; t&aacute;m lần tăng, s&aacute;u lần giảm v&agrave; ba lần giữ nguy&ecirc;n.</p>\r\n', '2023-06-12 15:14:50', 3);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
