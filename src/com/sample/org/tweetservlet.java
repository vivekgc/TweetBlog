package com.sample.org;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;
import java.util.UUID;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class tweetservlet
 */
@WebServlet("/tweetservlet")
public class tweetservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public final static Map<String, bean> tweetdb = new HashMap<>();
	
	public final static TreeMap<String, bean> treemap = new TreeMap<String, bean>(tweetdb);
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tweetservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		HttpSession session = request.getSession();	
		
		String usercomments = request.getParameter("uc");
		
		if(usercomments.isEmpty())
		{
			request.getRequestDispatcher("/home.jsp").forward(request, response);			
		}
		
		else
		{
			bean b = new bean();
				
			//UUID idOne = UUID.randomUUID();
			String tweetid = UUID.randomUUID().toString();
			
			String username = (String) session.getAttribute("username");
			DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss MM/dd");
			Date d =new Date();
			String dat = dateFormat.format(d);
 			
			b.setComment(usercomments);
			b.setUsername(username);
			b.setDate(dat);
			b.setTweetid(tweetid);
		
			
				//response.getWriter().println(""+b.getUsername());
			
			tweetservlet.tweetdb.put(tweetid,b);   
		    
			request.setAttribute("tweetdata",tweetdb );
			request.getRequestDispatcher("/home.jsp").forward(request, response);
		}	
		
		
	}

}
