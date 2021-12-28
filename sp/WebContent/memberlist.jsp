<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.util.ArrayList"%>
   <%@ page import="bbs.*" %>
   <%@ page import="user.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function check(ab_id) {
   pwd = prompt("수정/삭제하려면 비밀번호를 입력해주세요");
   document.location.href="log.jsp?UserID="+ab_id+"&UserPassword="+pwd;
}
</script>
<style type="text/css">
body { background: #090d00;  font: 400 1em/1.5 "Neuton";  color: rgba(255,255,255,.25);}
</style>
</head>
<body>
<jsp:useBean id="datas" class="user.UserDAO" scope="page"/>
	<%
		ArrayList<User> user =(ArrayList<User>)datas.getDBList();
	%>
	<div align="center">
		<h2>회원목록</h2>
		<br>
		<form>
		[<a href="main.jsp">메인페이지</a>]<p>
		
		<table border="1" align="center">
			<tr bgcolor="#8e8e8e">
				<th>아이디</th><th>비밀번호</th><th>이름</th><th>생년월일</th><th>성별</th>
			</tr>
		
		<%
			for(User ab:(ArrayList<User>)user){		
		%>
			<tr>
				<td><a href="javascript:onclick=check('<%=ab.getUserID() %>')"><%=ab.getUserID()%></a></td>
				<td><%=ab.getUserPassword() %></td>
				<td><%=ab.getUserName() %></td>
				<td><%=ab.getUserGender() %></td>
				<td><%=ab.getUserEmail() %></td>
				
			</tr>
			<%
				}
			%>
		</table>
		</form>
	</div>
</body>
</html>