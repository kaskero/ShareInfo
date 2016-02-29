<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*,helper.info.*" %>
<% ArrayList<MessageInfo> messageList = (ArrayList) request.getAttribute("messageList");
   String username = (String) session.getAttribute("username");
   ServletContext context = request.getServletContext();
   HashMap<String, String> loggedinUsers = (HashMap) context.getAttribute("loggedin_users"); %>
<html>
	<head>
		<title>View Messages</title>
		<link href="/ShareInfo/css/styleSheet.css" rel="stylesheet" />
	</head>
	<body>
		<header>
			<h1>A webapp to share short messages</h1>
			<h3>View Messages</h3>
		</header>
		<section>
			<a href="/ShareInfo/servlet/MainServlet" style="text-decoration: none">
				<font color="white">Refresh</font>
			</a>
			<a href="/ShareInfo/servlet/MainServlet?action=logout" style="text-decoration: none">
				<font color="white">Logout</font>
			</a>
		</section>
		<section>
		    <font color="white">You are logged in as: </font>
			<%= username %>
		</section>
		<section>
		    <font color="white">Active users: </font>
			<% for(Map.Entry<String, String> entry : loggedinUsers.entrySet()) { %>
	            <%= entry.getKey() %>
	        <% } %>
		</section>			
		<section>
			<form method="POST" action="/ShareInfo/servlet/MainServlet">
				<table>
	   				<tr>
	   					<td>Message:</td>
	   					<td><textarea name="message" cols="50" rows="5"></textarea></td>
	   				</tr>
	 			</table>
				<button>Send</button>
			</form>
		</section>
		<section>
			<table>
				<tr>
	   				<th>Username</th>
	   				<th>Message</th>
	   			</tr>
			<% for(int i = 0; i < messageList.size(); i++) {
				MessageInfo messageInfo = messageList.get(i); %>
	   			<tr>
	   				<td><%= messageInfo.getUsername() %></td>
	   				<td><%= messageInfo.getMessage() %></td>
	   			</tr>
	   		<% } %>
	 			</table>
		</section>		
		<footer>Web Systems - EUITI Bilbao</footer> 
	</body>
</html>