package shareinfo;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import helper.db.*;

public class SignupServlet extends HttpServlet{
	
	private MySQLdb mySQLdb;
	
	public void init(final ServletConfig config) {
		System.out.println("---> Entering init() SignupServlet");
		
		mySQLdb = new MySQLdb();
		
		System.out.println("---> Exiting init() SignupServlet");
	}

    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    	System.out.println("---> Entering doPost() SignupServlet");
    	
    	String email = request.getParameter("email");
		String password = request.getParameter("password");
		String username = request.getParameter("username");
		System.out.println("     Extracting request parameters: " + email + " " + password + " " + username);
		
		mySQLdb.setUserInfo(email, password, username);
		System.out.println("     Updating users table in the database");
		
		System.out.println("     Redirecting the user to loginForm.html");
		RequestDispatcher rd = request.getRequestDispatcher("/html/loginForm.html");
		rd.forward(request, response);
		
		//response.sendRedirect("/ShareInfo/html/loginForm.html"); // 302 redirect - location goiburua
		
        System.out.println("---> Exiting doPost() SignupServlet");
    }
}

