<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<br>
<h3 id="in4">학사 정보 목록</h3>
<br>
<table border=1 id="tab4">
<tr>
	<th>도서코드</th>
	<th>저자</th>
	<th>도서명</th>
</tr>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	ResultSet rs=null;
	
	PreparedStatement pstmt=null;
	try{
		String sql="select * from bookinfo1229 order by bookno";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String bookno=rs.getString("bookno");
			String author=rs.getString("author");
			String bookname=rs.getString("bookname");
%>
<tr>
	<td><a href="bookupdate.jsp?bookno=<%=bookno %>"><%=bookno %></a></td>
	<td><%=author %></td>
	<td><%=bookname %></td>
</tr>
<% 
	}
	}catch(SQLException e){
		System.out.println("조회 실패");
		e.printStackTrace();
	}
%>
</table>
<div class="btn_group">
<button id="btn1" type="button" onclick="location.href='bookinsert.jsp'">도서정보 추가</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>