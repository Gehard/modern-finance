<%@page import="com.green.bank.database.DatabaseOperations"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.green.bank.database.JDBC_Connect"%>
<%@page import="com.green.bank.model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/png" href="image/favicon.png" />
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="row">
		<jsp:include page="header.jsp" />
	</div>
	<%  String ac; %>

	<%
	ac = (String)request.getSession().getAttribute("account");
	
//	String account_no = ac.getAccount_no();
	JDBC_Connect connect = new JDBC_Connect();
	Connection conn = connect.getConnection();
	DatabaseOperations operations = new DatabaseOperations();
	//ac = operations.getAccountDetails(conn,account_no);
	//ac = (AccountModel)request.getSession().getAttribute("userDetails");
	
	//JDBC_Connect connect = new JDBC_Connect();
	//Connection conn = connect.getConnection();
	//DatabaseOperations operations = new DatabaseOperations();
	//AccountModel model= operations.getAccountDetails(conn,ac);
	
		
		//String account_no = ac.getAccount_no();
		AccountModel model= operations.getAccountDetails(conn,ac);
			%>
	<div class="container-fullwidth">
		<div class="row" style="margin-top: 50px;">
			<div class="alert alert-success col-md-4 col-md-offset-4"
				role="alert">
				<h4 class="alert-heading">Success!</h4>
				<p>
					<strong>Your Deposit operation is complete.</strong>
				</p>
				<p class="mb-0">
					<b>Account Number: </b>
					<%=model.getAccount_no()%>
				</p>
				<p class="mb-0">
					<b>Amount: </b>
					<%=model.getAmount()%>
				</p>
			</div>
		</div>
		<!-- Footer start here -->
		<div class="row" style="margin-top: 50px;">
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>