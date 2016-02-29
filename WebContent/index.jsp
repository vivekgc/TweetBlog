<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.sample.org.loginservlet"%>
<%@page  import="com.sample.org.bean" %>
<%@page  import="java.util.*" %>
<%@page  import="com.sample.org.tweetservlet" %>

<%! 
  	String un;
	String comment;
	String date;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assignment#1</title>
<style type="text/css">

body
{
	font-family:Arial, Helvetica, sans-serif;
}
h1 
{    
	font-size: 30px;
}
h3 
{    
	font-size: 20px;
}
.container
{
	margin: auto;
    width: 24%;
    border:3px solid #8AC007;
    padding: 10px;
}

</style>


</head>
<body>

<div class="container" align="center">
<h1>TweetBlog</h1>  
<div><h3><a href="login.jsp">Login</a>|  <a href="signup.jsp">Signup</a> </h3></div>
</div>

<div align="center">
 <h3>Recent posts:</h3> 
<table>
 <%
 
Map<String,bean> hm=(HashMap)tweetservlet.tweetdb;
 
 Map<String, bean> tm = new TreeMap<>();
 ArrayList<bean> al = new ArrayList<>();
 ArrayList<bean> al2 = new ArrayList<>();
 for (Map.Entry<String, bean> entry : hm.entrySet()) {
	 
	//	System.out.println("Key : " + entry.getKey() + " Value : " + entry.getValue());
		tm.put(entry.getValue().getDate(), entry.getValue());
	}
 
 for (Map.Entry<String, bean> entry : tm.entrySet())
 {
	 al.add(entry.getValue());
	 System.out.println("Key : " + entry.getKey() + " Value : " + entry.getValue().getComment());
	 
 }
 
 int size=al.size();
 for(int i=size-1;i>=0;i--)
 {
	 al2.add(al.get(i));
	 System.out.println(" Sorted objects:"+al.get(i).getComment() + al.get(i).getDate());
	 
 }
 
 Iterator<bean> it = al2.iterator();
	while (it.hasNext()) {
 //Map.Entry pair = (Map.Entry)it.next();
bean b1 = it.next();
 //bean b=(bean)pair.getValue();
 
  
   un=b1.getUsername();
   comment=b1.getComment();
   date=b1.getDate();
     %>
     <tr>
    <td><Strong>Blog: </Strong> <%= comment%></td>
    </tr>
    <tr>
    <td><font color="darkgrey">&nbsp; &nbsp; &nbsp; <i> Posted by: </i><strong> <%=un %> </strong><i> at </i><%=date %></font></td>
    </tr>
    <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    </tr>
<%    
 
 }
 %>
 
 </table>


</div>
</body>
</html>