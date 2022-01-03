<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	String custname=request.getParameter("custname");
	String bookno=request.getParameter("bookno");
	String outdate=request.getParameter("outdate");
	String indate=request.getParameter("indate");
	String status=request.getParameter("status");
	String class1=request.getParameter("class1");
	String bookname=request.getParameter("bookname");

	PreparedStatement pstmt=null;
	try{
		String sql="update reservation1229 set bookno=?,outdate=?,indate=?,status=?,class1=?,bookname=? where custname=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(7, custname);
		pstmt.setString(1, bookno);
		pstmt.setString(2, outdate);
		pstmt.setString(3, indate);
		pstmt.setString(4, status);
		pstmt.setString(5, class1);
		pstmt.setString(6, bookname);
		pstmt.executeUpdate();
		System.out.println("수정  성공");
	}catch(SQLException e){
		System.out.println("수정 실패");
		e.printStackTrace();
	}
%>
</body>
</html>