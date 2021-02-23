<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>chatbox</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link href="Stylesheet/Style.css" rel="stylesheet">
</head>
<body>
	<div>
	<%
if(request.getParameter("submit")!=null)
{
String Sender=request.getParameter("msg");
String Receiver=request.getParameter("receiverid");
String Message=request.getParameter("Message");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://database-1.cbviwvf76z0s.ap-south-1.rds.amazonaws.com:3306/chatbox","root","rootraja");
PreparedStatement ps=con.prepareStatement("insert into userdata(Message,Sender,Receiver)values(?,?,?)");
ps.setString(1, Message);
ps.setString(2, Sender);
ps.setString(3, Receiver);
ps.executeUpdate();
}
%>	
<%
String msg=request.getParameter("msg");
	if(msg!=null){
		%>
		<div class="row" id="row" style="width:100%;height:100px; text-align:center;">
		<h1 class="col-lg-10" style="padding:20px 20px"><%=msg %></h1>
		<a href="Home.jsp" class="col-lg-2" style="padding:20px 20px"><button class="btn btn-dark" style="margin:10px 20px; width:100px;float:right">Logout</button></a>
		</div>
		<%
	}
%>
		<form action="#" method="post" class="mb-3">
			<h4>Receiver Id</h4>
			<input class="form-control" type="text" name="receiverid" required>
			<h4>Message</h4>
			<textarea class="form-control" name="Message" row="3" required></textarea>
			<button type="submit" name="submit" class="btn btn-dark" style="margin:10px 20px; width:100px">Send</button>
		</form>
	</div>
	<div>
		<%
			Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://database-1.cbviwvf76z0s.ap-south-1.rds.amazonaws.com:3306/chatbox","root","rootraja");
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from userdata where Receiver='"+msg+"'");
		while(rs.next())
		{
		%>
			<div id="messagebox">
				Message from <span><%=rs.getString("Sender") %></span>
				<p><%=rs.getString("Message") %></p> 	
			</div>
		<%}
		%>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
	