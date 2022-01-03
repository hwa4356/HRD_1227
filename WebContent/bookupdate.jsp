<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if(document.form.bookno.value==""){
		alert("도서코드가 입력되지 않았습니다.");
		document.form.bookno.focus();
	}else if(document.form.author.value==""){
		alert("저자가 입력되지 않았습니다.");
		document.form.author.focus();
	}else if(document.form.bookname.value==""){
		alert("도서이름이 입력되지 않았습니다.");
		document.form.bookname.focus();
	}else{
		document.form.submit(); 
	}
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<br>
<h3 id="in4">학사 정보 등록 화면</h3>
<br>
<%@ include file="DBConn.jsp" %>
<%
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	String bookno=request.getParameter("bookno");
	try{
		String sql="select * from bookinfo1229 where bookno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, bookno);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String author=rs.getString("author");
			String bookname=rs.getString("bookname");
%>
<form name="form" method="post" action="bookupdateprocess.jsp">
<table border=1 id="tab1">
<tr>
	<th width="20%">도서코드</th>
	<td><input id="in1" type="text" name="bookno" value="<%=bookno %>">
	</td>
</tr>
<tr>
	<th width="20%">저자</th>
	<td><input id="in1" type="text" name="author" value="<%=author %>">
	</td>
</tr>
<tr>
	<th width="20%">도서이름</th>
	<td><input id="in1" type="text" name="bookname" value="<%=bookname %>">
	</td>
</tr>
<tr>
	<td colspan=2 align=center>
	<input id="in3" type="button" value="수정" onclick="check()">
	<input id="in3" type="button" value="취소">
	</td>
</tr>
</table>
</form>
<%
		}
		}catch(SQLException e){
			System.out.println("도서 조회 실패");
			e.printStackTrace();
		}
%>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>