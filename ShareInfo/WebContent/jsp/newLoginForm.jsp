<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="/ShareInfo/css/styleSheet.css" rel="stylesheet" />
</head>
	<body>
		<header>
			<h1>A webapp to share short messages</h1>
			<h3>Log in form</h3>
		</header>
		<% if((boolean) request.getAttribute("login_error")) { %>
		<section>
		    <h3>LOGIN ERROR!!!</h3>
		</section>
		<% } %>
		<section>
			<form method="POST" action="/ShareInfo/servlet/LoginServlet">
				<table>
	   				<tr>
	   					<td>Email:</td>
	   					<td><input name="email"/></td>
	   				</tr>
	   				<tr>
	   					<td>Password:</td>
	   					<td><input type="password" name="password"/></td>
	   				</tr>
	 			</table>
				<button>Send</button>
			</form>
		</section>
		<section>
			<a href="/ShareInfo/html/signupForm.html" style="text-decoration: none">
				<font color="white">Sign Up</font>
			</a>
		</section>
		<footer>Web Systems - EUITI Bilbao</footer> 
	</body>
</html>