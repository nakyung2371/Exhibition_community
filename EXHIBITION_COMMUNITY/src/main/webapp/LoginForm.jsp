<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//세션 변수의 값을 읽어옴
	String sessionId = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
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
            height: 750px;
            margin: 0 auto;
            text-align: right;
        }

        .loginbox {
            padding-top: 100px;
            display: flex;
            /* align-items: center; */
            justify-content: center;
        }

        .login-container {
            border: 1px solid #b0bbcc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 400px;
            height: 500px;
            text-align: center;
        }

        .login-header {
            color: #1D375F;
            padding-top: 50px;
        }

        .login-body {
            margin-top: 70px;
            padding: 20px;
        }

        .login-input {
            width: 80%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 15px;
        }

        .login-button {
            background-color: #1D375F;
            color: #fff;
            padding: 10px 125px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 15px;
        }

        .login-button:hover {
            background-color: #0F1F3A;
        }

        .signup {
            padding-top: 15px;
        }

        .signup a {
            color: #636363;
            font-size: 13px;
        }

        .signup a:hover {
            text-decoration-line: underline;
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
    </style>
</head>

<body>
	<%
		if (sessionId == null) {		//로그인 되지 않은 상태
	%>
    <div class="headertop"></div>
    <header>
        <div class="logo">
            <a href="index.jsp"><img src="img/logo.png"></a>
        </div>
        <div class="menubar">
            <ul class="menuItem">
                <li><a href="exhibition.html">전시</a></li>
                <li>
                    <a href="community_review.html">커뮤니티</a>
                    <ul>
                        <li><a href="community_review.html">관람 후기</a></li>
                        <li><a href="community_accompany.html">관람 동행</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="login">
            <ul>
                <li><a href="LoginForm.jsp">로그인</a></li>
            </ul>
        </div>


        <div id="clear"></div>
    </header>

    <div id="clear"></div>

    <main>
        <div class="loginbox">
            <div class="login-container">
                <div class="login-header">
                    <b style="font-size: 40px;">LOGIN</b>
                </div>
                <div class="login-body">
                    <form>
                        <input type="text" class="login-input" placeholder="아이디" required>
                        <input type="password" class="login-input" placeholder="비밀번호" required>
                        <button type="submit" class="login-button">로그인</button>
                    </form>
                    <p class="signup"><a href="signup.html">회원가입</a></p>
                </div>
            </div>
        </div>
    </main>

    <div id="clear"></div>
    <footer>
        <div class="address">
            <a class="ad1" href="#">공지사항</a>
            <hr>
            <a class="ad2" href="#">필독 공지</a>
            <a class="ad2" href="#">이용약관</a>
            <a class="ad2" href="#">개인정보처리방침</a>
        </div>
    </footer>
    <%
		} else {	//로그인 된 상태
	%>
	<%
		}
	%>
</body>
</html>