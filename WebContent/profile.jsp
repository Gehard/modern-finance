<%@page import="com.green.bank.database.DatabaseOperations"%>
<%@page import="com.green.bank.database.JDBC_Connect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.green.bank.model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<% String ac;%>

<%
ac = (String)request.getSession().getAttribute("account");
JDBC_Connect connect = new JDBC_Connect();
Connection conn = connect.getConnection();
DatabaseOperations operations = new DatabaseOperations();
AccountModel model= operations.getAccountDetails(conn,ac);

%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=model.getFirst_name() + " " + model.getLast_name()%></title>
<link rel="shortcut icon" type="image/png" href="image/favicon.png" />
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/profile.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="row">
		<jsp:include page="header.jsp" />
	</div>

	<div class="container-fullwidth">
		<div class="jumbotron col-md-6 col-md-offset-3"
			style="margin-top: 50px">
			<div class="row">
				<div class="profile-head col-md-10 col-md-offset-1">
					<div class="col-md-4 ">
						<img class="img-circle img-responsive" alt="" src="image/user.png">
					</div>


					<div class="col-md-6 ">
						<h2><%=model.getFirst_name() + " " + model.getLast_name()%></h2>
						<ul>
							<li class="navli"><span
								class="glyphicon glyphicon-map-marker"></span> <%=model.getBranch()%></li>
							<li class="navli"><span class="glyphicon glyphicon-home"></span>
								<%=model.getAddress()%></li>
							<li class="navli"><span class="glyphicon glyphicon-phone"></span><%=model.getPhone_number()%></li>
							<li class="navli"><span class="glyphicon glyphicon-envelope"></span><%=model.getEmail()%></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="account_details col-md-10 col-md-offset-1"
					style="margin-top: 30px;">
					<h2>Account Details</h2>
					<hr class="divider">
					<table class="table table-user-information col-md-6">
						<tbody>
							<tr>
								<td><b>First Name:</b></td>
								<td><%=model.getFirst_name()%></td>
							</tr>
							<tr>
								<td><b>Last Name:</b></td>
								<td><%=model.getLast_name()%></td>
							</tr>
							<tr>
								<td><b>Account Number:</b></td>
								<td><%=model.getAccount_no()%></td>
							</tr>
							<tr>
								<td><b>City</b></td>
								<td><%=model.getCity()%></td>
							</tr>
							<tr>
								<td><b>Branch Name</b></td>
								<td><%=model.getBranch()%></td>
							</tr>
							<tr>
								<td><b>Postal Code</b></td>
								<td><%=model.getPostalCode()%></td>
							</tr>
							<tr>
								<td><b>UserName</b></td>
								<td><%=model.getUsername()%></td>
							</tr>
							<tr>
								<td><b>Phone Number</b></td>
								<td><%=model.getPhone_number()%></td>
							</tr>
							<tr>
								<td><b>Email</b></td>
								<td><a href="mailto:" +<%=model.getEmail()%>><%=model.getEmail()%></a></td>
							</tr>
							<tr>
								<td><b>Account Type</b></td>
								<td><%=model.getAccount_type()%></td>
							</tr>
							<tr>
								<td><b>Registration Date</b></td>
								<td><%=model.getReg_date()%></td>
							</tr>
							<tr>
								<td><b>Amount</b></td>
								<td><%=model.getAmount()%>. KSH</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="row"></div>

		<!-- Footer start here -->
		<div class="row" style="margin-top: 50px;">
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>