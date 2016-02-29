<%@page import="com.sample.org.loginservlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page  import="com.sample.org.bean" %>
<%@page  import="java.util.*" %>
<%@page  import="com.sample.org.tweetservlet" %>


<%! 
   	String name;
	String un;
	String comment;
	String date;
%>
<%
if(session.getAttribute("username")==null)
{
	response.sendRedirect("/Assignment1/login.jsp");	
} %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Homepage</title>

<style type="text/css">

body
{
	font-family:Arial, Helvetica, sans-serif;
}

h3{  font-size: 25px;
}
.container
{
	margin: auto;
    width: 500px;
    border:3px solid #8AC007;
    padding: 10px;
}
input[type="submit"]
{
    padding: 5px;
    font-size:15px;
}
textarea
{ 
	font-family:Arial, Helvetica, sans-serif;
	font-size: 15px;
}
#charNum
{
	font-size: 13px;
}
</style>

</head>

<script src="http://code.jquery.com/jquery-1.5.js"></script>

<script>


function logout()
{
	document.location.href="logout";
	alert("Successfully loggedout");
}

function check() 
{ 
if(!document.textArea.message.value=="") 
{ 
	windows.aler
}	
}	
function countChar(val) {
	var len = val.value.length;
    if (len >= 140) {
      val.value = val.value.substring(0, 140);
      $('#charNum').text('Max limit reached..!!!');
    } else {
      $('#charNum').text(140 - len + ' characters remaining..!!');
    }
  };
  
  function check(form){
	    if (form.uc.value.trim() == ""){
	        alert("Please Posts something..");
	        return false;
	    }
	}
</script>

<body>
<div class="container" align = "center">
<%
	name = (String)session.getAttribute("username");
%>

<div>
<table>
<tr>
	<td><h3> Hello, <%= name%> <div align="center"></td></h3>
	<td><input type="submit" onclick="logout()" value="Logout"/></div> </td>
</tr>
<tr>
<td><form id="tweet" action="tweetservlet" method="post" onsubmit="return check(this)">
<h4>Enter your comment: </h4>
<textarea name="uc" rows="4" cols="50" maxlength="140" placeholder='Enter comment here' onkeyup="countChar(this)" required> </textarea><br/> <br/>
<div id = "charNum"></div><br/>
<input type="submit" value="Submit">

</form>
</td>
</tr> 
</table>
</div>

 <div> <h4> <a href="index.jsp">Click here to view the Comments: </a> </h4></div>
 
 <h3>Recent posts:</h3>
 <table>
 <%
 
 Map<String,bean> hm=(HashMap)tweetservlet.tweetdb;
 
 Map<String, bean> tm = new TreeMap<>();
 ArrayList<bean> al = new ArrayList<>();
 ArrayList<bean> al2 = new ArrayList<>();
 for (Map.Entry<String, bean> entry : hm.entrySet()) {
	 
	 //System.out.println("Key : " + entry.getKey() + " Value : " + entry.getValue());
		tm.put(entry.getValue().getDate(), entry.getValue());
	}
 
 for (Map.Entry<String, bean> entry : tm.entrySet())
 {
	 al.add(entry.getValue());
	 //System.out.println("Key : " + entry.getKey() + " Value : " + entry.getValue().getComment());
	 
 }
 
 int size=al.size();
 for(int i=size-1;i>=0;i--)
 {
	 al2.add(al.get(i));
	 //System.out.println(" Sorted objects:"+al.get(i).getComment() + al.get(i).getDate()); 
 }

Iterator<bean> it = al2.iterator();
	while (it.hasNext()) {
    //Map.Entry pair = (Map.Entry)it.next();
   	bean b1 = it.next();
    //bean b=(bean)pair.getValue();
     
      un=b1.getUsername();
      if(un.equals(name))
      {
      comment=b1.getComment();
      date=b1.getDate(); 
     %>  

    <tr>
    <td><Strong>Blog: </Strong> <%= comment%></td>
    </tr>
    <tr>
    <td><font color="darkgrey">&nbsp; &nbsp; &nbsp; <i> By: </i><%=un %><i> at </i><%=date %></font></td>
    </tr>
    <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    </tr>
    <%
      }
	}
%>
 
 </table>
 </div>
</body>
</html>