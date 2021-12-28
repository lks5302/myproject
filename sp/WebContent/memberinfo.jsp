<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="bbs.*"%>
    <%@page  import="user.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
<style type="text/css">
body {  background: #090d00; text-align: center; color: orange;}

	a{
	
		text-decoration: none;
	}
	table{
		text-align: center;
		margin-top: 50px;
		margin-bottom: 30px;
		border: 1px solid gray;
		border-collapse: collapse;
		background-color: #fff;
		width: 500px; height: 500px;
		padding: 0px;
	}
	input{
		border: 0px;
	
		box-shadow: 1px 1px darkgray;
		text-align: center;
		border:0px;
		width: 10%; height: 10%;
		margin: 20px;
	}
	#btn{
		text-align: center;
		width: 80px; height: 30px;
		box-shadow: 1px 1px darkgray;
	}
	a{
		font:yellow;
		text-decoration: none;
	}
</style>
</head>
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
<jsp:useBean id="data" class="user.UserDAO" scope="page">
		<div id="content">
			<%
				String id = (String)session.getAttribute("LOGIN");
				if(id != null){
					User user = data.getSdmember(id);
					
		out.print("<form action='memberupdate.jsp' method='post'");
			out.print("<table border='1'>");
				out.print("<tr><th>회원정보</th></tr><br>");
					out.print("<tr><th>아이디	</th><td><input type='text' name='userID' value='"+user.getUserID()+"'>			</td>");
					out.print("<td>비밀번호	</td><td><input type='password' name='userPassword' value='"+user.getUserPassword()+"'>	</td>");
					out.print("<td>이름		</td><td><input type='text' name='userName' value='"+user.getUserName()+"'>		</td>");
					out.print("<td>성별	</td><td><input type='text' name='userGender' value='"+user.getUserGender()+"'>		</td>");
					out.print("<td>이메일		</td><td><input type='text' name='userEmail' value='"+user.getUserEmail()+"'>	</td></tr><br><br>");
				/* out.print("<tr><td><input id='btn' type='submit' value='수정완료'></td></tr>"); */
			out.print("</table>");
		out.print("</form>");
				}else{
					response.sendRedirect("main.jsp");
				}
			%>
			<a href="main.jsp">메인페이지가기</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="memberdelete.jsp?UserID="<%=id %>>회원탈퇴</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		
	</jsp:useBean>
</body>
</html>