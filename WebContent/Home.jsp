<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
if(request.getParameter("submit")!=null){
	int x=0;
	String userid=request.getParameter("userid");
	String password=request.getParameter("password");
	Class.forName("com.mysql.jdbc.Driver");
	//Connection con=DriverManager.getConnection("instance1.cbviwvf76z0s.ap-south-1.rds.amazonaws.com:3307/chatbox","root","rootraja");
	Connection con=DriverManager.getConnection("jdbc:mysql://database-1.cbviwvf76z0s.ap-south-1.rds.amazonaws.com:3306/chatbox","root","rootraja");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from userlogins where Userid='"+userid+"' and Password='"+password+"'");
	while(rs.next())
	{
		 x=1;
		 response.sendRedirect("chatbox.jsp?msg="+userid+"");
	}
	if(x==0)
	{
		
response.sendRedirect("Home.jsp");
	}
	
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link href="Stylesheet/Style.css" rel="stylesheet">
</head>
<body id="homebody">
	<div id="container">
	<form action="#" method="post" class="mb-3">
		<label class="form-label">UserId</label>
		<input type="text" name="userid" id="userid" class="form-control">
		<label class="form-label">Password</label>
		<input type="password" name="password" id="password" class="form-control">
		<button type="submit" name="submit" id="btn" class="btn btn-primary">Login</button>
	</form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>