package pkg;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * Servlet implementation class hw2servlet
 */
@WebServlet("/hw2servlet")
public class hw2servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.print("HI");
		PrintWriter out = response.getWriter();
		String query = request.getParameter("query");
		String error = "";
		
		if(query == null || query.length() == 0 || query.isEmpty()) {
			error = "Please enter something to search. \n";
		}
		
		out.println(error);		
		out.flush();
		out.close();
	}
}

//key=API_KEY: AIzaSyDR7oXjSnBunS_iYN-fYrtqYTAwObwf3GM