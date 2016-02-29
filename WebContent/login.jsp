<%@ page import="javax.servlet.RequestDispatcher" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<title>Login</title>

<style type="text/css">

body
{
	font-family:Arial, Helvetica, sans-serif;
}
.container
{
	margin: auto;
    width: 24%;
    border:3px solid #8AC007;
    padding: 10px;
}
input[type="submit"]
{
    padding: 5px;
    font-size:15px;
}
</style>

</head>
<body>
<div class="container" align="center">
<h2>Login</h2>

<table>

<form id="fm" action="loginservlet?var=login" method="post">

<tr>
	<td align="center" valign="top"><b>Username</b></td>
	<td><input type="text" name="username" required/><br /><br /></td>
</tr>

<tr>
	<td align="center" valign="top"><b>Password</b></td>
	<td><input type="password" name="password" required/><br /><br /></td>
</tr>

<tr>
	<td></td>
	<td><input type="submit" value="Log In" /><br/><br/></td>
</tr>

<tr>
	<td align="center" valign="top"><Strong>New User?</Strong> 
	<td><a style="text-decoration:none;color:blue;" href="loginservlet?var=signup"><u>Sign Up</u></a><br/><br/></td>
</tr>
<tr>
<td align="center"><Strong>Home Page?</Strong>
<td><a style="text-decoration:none;color:blue;" href="index.jsp"><u> Click here</u></a></td>
</tr>

</table>
</form>
</div>
</body>
</html>