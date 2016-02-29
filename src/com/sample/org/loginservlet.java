package com.sample.org;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTMLDocument.Iterator;


/**
 * Servlet implementation class loginservlet
 */
@WebServlet("/loginservlet")
public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 final static Map<String,String>userdatabase = new HashMap<>();
    
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd;
		String var = request.getParameter("var");
		if(var!=null)
		{	
		 if(var.equals("signup"))
		 {
			rd = request.getRequestDispatcher("/signup.jsp");
			rd.forward(request, response);
			return;
		 }
		 if(var.equals("back"))
		 {
			 rd = request.getRequestDispatcher("/jsp/login.jsp");
		     rd.forward(request, response);
		     return;
		 }	 
		}
		HttpSession session = request.getSession();
		if(session.getAttribute("username")!=null)
		{
			
			request.getRequestDispatcher("/home.jsp").forward(request,response);
			return;
		}
		
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		String var = request.getParameter("var");
		int flag=0;
		if(var!=null)
		{
			if(var.equals("login"))
			{
				String username = (String)request.getParameter("username");
				String password = (String)request.getParameter("password");
				
				
				if(username.isEmpty()|| password.isEmpty() || !userdatabase.containsKey(username) || !password.equals(userdatabase.get(username)))
				{
					flag=1;
					response.getWriter().println(userdatabase.get(username));
					request.setAttribute("loginfailed", "yes");
					request.getRequestDispatcher("/login.jsp").forward(request,response);
				}
				if(flag==0)
				{
					session.setAttribute("username", username);
					request.getRequestDispatcher("/home.jsp").forward(request,response);
				}
			}
			if(var.equals("signup"))
			{
				String username = request.getParameter("un");
				String password = request.getParameter("pw");
				String confirm = request.getParameter("cpw");
				
				if((!password.equals(confirm))|| (username.isEmpty()) || (password.isEmpty()) || userdatabase.containsKey(username))
				{
					request.setAttribute("Signin", "failed");
					request.getRequestDispatcher("/signup.jsp").forward(request, response);					
				}
				
				else
				{                            
					userdatabase.put(username, password);
					 //System.out.println(loginservlet.userdatabase.size());
					session.setAttribute("username", username);
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				}
			}
		}
		
		                
	}

}
