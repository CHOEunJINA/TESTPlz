<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		
	String id =request.getParameter("id");
	String pw =request.getParameter("pw");
	String name =request.getParameter("name");
	String email =request.getParameter("email");
	String phone1 =request.getParameter("phone1");
	String phone2 =request.getParameter("phone2");
	String phone3 =request.getParameter("phone3");
	String gender =request.getParameter("gender");
	
	String url = "jdbc:mariadb://localhost:3306/test";
	String uid ="root";
	String upw ="12341234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int result=0;
	String sql = "insert into members values(?,?,?,?,?,?,?)";
	
	try{
		request.setCharacterEncoding("UTF-8");
		// 1. ����̹� �ε�
		Class.forName("org.mariadb.jdbc.Driver");
				// 2. conn ����
		conn = DriverManager.getConnection(url, uid, upw);
		
		// 3. pstmt ����
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setString(4, phone1);
		pstmt.setString(5, phone2);
		pstmt.setString(6, phone3);
		pstmt.setString(7, gender);
		
		// 4. sql�� ����
		result = pstmt.executeUpdate();
		
		if(result == 1){ // ����
			response.sendRedirect("join_succes.jsp");
		} else{ // ����
			response.sendRedirect("join_fail.jsp");
		}
		out.println("����");
		
	} catch(Exception e){
		e.printStackTrace();
		out.println("����");
	} finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		} catch(Exception e){
			e.printStackTrace();
			out.println("����̹� ����");
		}
	}
	%>
</body>
</html>