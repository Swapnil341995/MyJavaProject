<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<%
    	if(request.getParameter("submit")!=null)
    	{
    		String id = request.getParameter("id");
    		String name = request.getParameter("sname");
    		String course = request.getParameter("course");
    		String fee = request.getParameter("fee");
    		
    		Connection con;
    		PreparedStatement pst;
    		ResultSet rs;
    		
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost/Student","root","");
    		pst = con.prepareStatement("update records set stname = ?,course = ?,fee = ? where id = ?");
    		pst.setString(1, name);
    		pst.setString(2, course);
    		pst.setString(3, fee);
    		pst.setString(4, id);
    		pst.executeUpdate();
    		
%>
    		<script>
    			alert("Record updated");
    		</script>
    		

<%
    		
    	}
    %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<h1>Student Update</h1>
	<div>
		<div class="col-sm-4">
			<form class="" method="post" action="#">

				<%
					Connection con;
					PreparedStatement pst;
					ResultSet rs;

					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost/Student", "root", "");

					String id = request.getParameter("id");

					pst = con.prepareStatement("select * from records where id = ?");
					pst.setString(1, id);
					rs = pst.executeQuery();

					while (rs.next()) {
				%>

				<div align="left">
					<label class="form-label"> Student Name</label> <input type="text"
						class="form-control" placeholder="Student Name" name="sname"
						id="sname" value="<%=rs.getString("stname")%>" required>
				</div>

				<div align="left">
					<label class="form-label"> Course</label> <input type="text"
						class="form-control" placeholder="Course" name="course"
						id="course" value="<%=rs.getString("course")%>" required>
				</div>

				<div align="left">
					<label class="form-label">Fee</label> <input type="text"
						class="form-control" placeholder="Fee" name="fee" id="fee"
						value="<%=rs.getString("fee")%>" required>
				</div>
				<%
					}
				%>
				<br>
				<div align="right">
					<input type="submit" id="submit" name="submit" class="btn btn-info">
					<input type="reset" id="reset" name="reset" class="btn btn-warning">
				</div>
				<div align = "right">
					<p><a href="Index.jsp">Back</a></p>
				</div>
			</form>
		</div>
	</div>
</body>
</html>