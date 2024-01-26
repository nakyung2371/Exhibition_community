<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "users.UsersDTO" %>

<%
	//세션 변수의 값을 읽어옴
	String sessionId = (String) session.getAttribute("id");
	String sessionRole = (String) session.getAttribute("role");
%>

<%

UsersDTO member = new UsersDTO();
String id = (String) session.getAttribute("id");

	if (id != null) {
%>
		이미 로그인 되었습니다.
		<p/><br> <a href = "http://localhost:8181/EXHIBITION_COMMUNITY"> 홈으로 </a>
<%
	return;
	}
%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원가입 </title>
<!-- CDN을 사용해서 부트 스트랩 라이브러리 등록 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" as="style" crossorigin
        href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
    <link rel="stylesheet" type="text/css"
        href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/variable/pretendardvariable.css" />
    <style>
    @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }

        * {
            list-style: none;
            text-decoration: none;
            font-family: "Pretendard-Regular";
        }

        a {
            text-decoration-line: none;
        }

        #clear {
            clear: both;
        }

        .headertop {
            width: 100%;
            height: 20px;
            background-color: #1D375F;
            margin: 0 auto;

        }

        header {
            position: relative;
            width: 1240px;
            height: 120px;
            margin: 0 auto;
            padding-top: 20px;
        }

        .logo {
            width: 300px;
            height: 100px;
            display: flex;
            float: left;
            align-items: center;
        }

        .menubar {
            margin: 0 auto;
            float: left;
            margin-top: 40px;
            font-size: 18px;

        }

        .menubar ul {
            height: 50px;
            list-style: none;
        }

        .menubar li {
            float: left;
        }

        .menubar a {
            color: black;
            display: block;
            font-weight: normal;
            line-height: 49px;
            padding: 1px 25px;
            text-align: center;
        }

        .menubar li a:hover,
        .menubar ul li:hover a {
            color: #FFA16D;
        }

        .menubar li:hover ul {
            display: block;
        }

        .menubar li:hover li a {
            background: none;
        }

        .menubar li ul {
            background: #1D375F;
            display: none;
            height: auto;
            position: absolute;
            z-index: 999;
        }

        .menubar li li a,
        .menubar li li {
            background: #1D375F;
            display: block;
            float: none;
            min-width: 135px;
        }

        .menubar li ul a {
            display: block;
            height: 50px;
            font-size: 14px;
            font-style: normal;
            padding: 0px 10px 0px 15px;
            text-align: left;
        }

        .menubar li ul a:hover,
        .menubar li ul li:hover a {
            background: #636363;
            border: 0px;
            color: #ffffff;
        }

        .login {
            float: right;
            margin-right: 20px;
            margin-top: 55px;
            font-size: 15px;
            font-family: "Pretendard-Regular";
        }

        .login a {
            color: #000000;
        }

        .login a:hover {
            color: #a5a5a5;
        }

        main {
            position: relative;
            width: 1240px;
            height: 820px;
            margin: 0 auto;
            text-align: right;
        }

        .signupbox {
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 90px;
        }

        .signup-container {
            border: 1px solid #b0bbcc;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 700px;
            height: 700px;
            padding: 30px;
            /* 변경: 전체 패딩을 조정 */
        }

        .signup-header {
            color: #1D375F;
            font-size: 25px;
            margin-bottom: 30px;
            /* 변경: 헤더와 바디 간격 조정 */
            padding-top: 40px;
            padding-left: 40px;
            text-align: left;
            /* 변경: 텍스트를 좌측 정렬 */
        }

        .signup-body {
            margin-top: 70px;
            /* 변경: 바디 위 간격을 줄임 */
            padding-left: 40px;
            text-align: left;
            /* 변경: 텍스트를 좌측 정렬 */

        }

        .signup-input {
            width: 30%;
            /* 변경: 입력 필드의 너비 조정 */
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 15px;
            display: inline-block;
            /* 변경: 인라인 블록 요소로 변경 */
        }

        .check-button {
            width: 20%;
            /* 변경: 버튼의 너비 조정 */
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            background-color: #ff823e;
            border: 1px solid #FFA16D;
            color: #fff;
            /* border-radius: 4px; */
            font-size: 15px;
            cursor: pointer;
            display: inline-block;
            /* 변경: 인라인 블록 요소로 변경 */

        }

        .signup-button {
            background-color: #1D375F;
            color: #fff;
            padding: 10px 100px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 18px;
            margin-top: 50px;
            margin-right: 180px;
        }

        .signup-button:hover {
            background-color: #0F1F3A;
        }

        .gender-input {
            text-align: left;
            margin-top: 6px;
        }

        footer {
            position: relative;
            width: 100%;
            height: 180px;
            margin: 0 auto;
            text-align: left;
            color: #ffffff;
            background-color: #1D375F;
        }

        .address {
            width: 1240px;
            margin: 0 auto;
            padding-top: 30px;
        }

        .ad1 {
            color: #cbd7e9;
        }

        .ad2 {
            color: #617aa0;
            font-size: 14px;
            padding-right: 20px;
        }

        .f1 {
            width: 100px;
            margin-right: 12px;
        }
    </style>
    
</head>
<body>
	<%
		if (sessionId == null) {		//로그인 되지 않은 상태
	%>
	<form method = "post" action = "insertUser.us">
		<table>
			<tr>
				<td> ID </td>
				<td> <input type = "text" name = "id"> </td>
			</tr>
			<tr>
				<td> PASSWORD </td>
				<td> <input type = "password" name = "password"> </td>
			</tr>
			<tr>
				<td> 휴대폰 번호 </td>
				<td> <input type = "text" name = "phone"> </td>
			</tr>
			<tr>
				<td> 이메일 </td>
				<td> <input type = "text" name = "email"> </td>
			</tr>
			<tr>
				<td> 주소 </td>
				<td> <input type = "text" name = "addr"> </td>
			</tr>
			<tr>
				<td colspan = "2" align = "center"> <input type = "submit" value = "회원가입"> </td>
			</tr>
		</table>
	</form>
	
	<p/> <a href = "http://localhost:8181/JSP_MY_PROJ"> 홈으로 </a>

	<%
		} else {	//로그인 된 상태
	%>
	
		<%= sessionId %>님 로그인 성공되었습니다. <p/>
		당신의 권한은 <%= sessionRole %>입니다. <p/>
		
		<a href = "http://localhost:8181/EXHIBITION_COMMUNITY"> 홈으로 </a> <p/>
		<a href = "logout.us"> 로그아웃 </a>
	
	<%
		}
	%>
	</center>
</body>
</html>