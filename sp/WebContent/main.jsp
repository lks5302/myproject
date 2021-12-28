<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
<style type="text/css">
body { font: 400 1em/1.5 "Neuton"; background: #090d00; color: rgba(255,255,255,.25); text-align: center; margin: 0 }
p {
	text-transform: uppercase;
	letter-spacing: .5em;
	display: inline-block;
	border: 4px double rgba(255,255,255,.25);
	border-width: 4px 0;
	padding: 1.5em 0em;
	position: absolute;
	top: 18%;
	left: 50%;
	width: 40em;
	margin: 0 0 0 -20em;
}
 span {

  	font: 700 4em/1 "Oswald", sans-serif;
  	letter-spacing: 0;
  	padding: .25em 0 .325em;
	  display: block;
	  margin: 0 auto;
  	text-shadow: 0 0 80px rgba(255,255,255,.5);

	  background: url(https://i.ibb.co/RDTnNrT/animated-text-fill.png) repeat-y;
	  -webkit-background-clip: text;
	  background-clip: text;

	  -webkit-text-fill-color: transparent;
	  -webkit-animation: aitf 80s linear infinite;

	  -webkit-transform: translate3d(0,0,0);
	  -webkit-backface-visibility: hidden;

  }

@-webkit-keyframes aitf {
	0% { background-position: 0% 50%; }
	100% { background-position: 100% 50%; }
}
</style>
</head>
<body>
	<body>
	<%
		String userID = null;
	
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%>
	
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">The Rich.</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<%
				if(userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="memberlist.jsp">회원리스트</a></li>
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<p>
  On the way to the rich
  <span>
    The Rich.
  </span>
  &mdash; On the way to the rich &mdash;
</p>
<br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br>
			<h1>환영합니다 더 리치 입니다</h1>
			<h2>저희 사이트는 이용자들이  </h2>
			<h2>모두 부자가 되는걸 목표로 하고있습니다</h2>
			<h2>가상화폐 주식 부동산 정보를 공유하는 공간입니다</h2>
			<h2>앞으로도 많은 이용 바랍니다</h2>
</body>
</html>