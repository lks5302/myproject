<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="bbs.*" %>
    <%@page import="user.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body { background: #090d00; text-align: center;}

</style>
</head>
<body>
	<jsp:useBean id="data" class="user.UserDAO" scope="page"/>
	
	<%
		String id = (String)session.getAttribute("LOGIN");
		if(id != null){
			if(data.removeUser(id) != 0){
				out.print("<h3>그동안 이용해주셔서 감사합니다</h3>");
				out.print("<h3>회원정보를 삭제하였습니다</h3>");
				session.invalidate();
				
				out.print("<h3><a href='main.jsp'>로그인화면으로 돌아가기</a></h3>");
			}else{
				out.print("<h3>회원정보를 삭제하지 못함, 잠시후 다시 시도해주세요</h3>");
				out.print("<h3><a href='memberinfo.jsp'>학생정보 보기화면으로 돌아가기</a></h3>");
			}
		}else{
			out.print("<h3>로그인이 필요합니다</h3>");
			response.sendRedirect("mian.jsp");		
		}
	%>
</body>
</html>