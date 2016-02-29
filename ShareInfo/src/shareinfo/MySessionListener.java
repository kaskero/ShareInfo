package shareinfo;

import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
 
public class MySessionListener implements HttpSessionListener {
 
	public void sessionCreated(HttpSessionEvent event) {
		System.out.println("     A session is being created");
	}
 
	public void sessionDestroyed(HttpSessionEvent event) {
		System.out.println("     A session is being destroyed");
		
		HttpSession session = event.getSession();
		String sessionID = session.getId();
		System.out.println("     Getting user sessionID: " + sessionID);
		ServletContext context = session.getServletContext();
		HashMap<String, String> loggedinUsers = (HashMap) context.getAttribute("loggedin_users");
		System.out.println("     Loggedin users: " + loggedinUsers.toString());
		
		for(Map.Entry<String, String> entry : loggedinUsers.entrySet()) {
            if(entry.getValue().equals(sessionID)) {
            	loggedinUsers.remove(entry.getKey());
            	System.out.println("     Removing " + entry.getKey() + " from loggedin users");
            	context.setAttribute("loggedin_users", loggedinUsers);
            	System.out.println("     Loggedin users: " + loggedinUsers.toString());
            	break;
            }
		}
	}
 
}

 