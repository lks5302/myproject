<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="bbs.*" %>
    <%@page import="user.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		request.setCharacterEncoding("utf-8");
	%>
		<jsp:useBean id="data" class="user.UserDAO" scope="request"></jsp:useBean>
	<%
		String id = request.getParameter("UserID");
		String pw = request.getParameter("UserPassword");
		
		if(data.isUser(id, pw)){
			session.setAttribute("LOGIN", id);
			
			RequestDispatcher rd = request.getRequestDispatcher("memberinfo.jsp");
			rd.forward(request, response); 
		}
	%>
	
	
	<h3>죄송합니다. 등록된 회원이 아닙니다. 신규회원등록으로 돌아가시겠습니까?<br>
		<a href="join.jsp">회원등록으로 가기</a>
	</h3>
</body>
</html>