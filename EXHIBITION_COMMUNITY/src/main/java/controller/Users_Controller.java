package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import users.UsersDAO;
import users.UsersDTO;

import java.io.IOException;

//http://localhost:8181/EXHIBITION_COMMUNITY/*.us
@WebServlet
public class Users_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Users_Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		//한글이 깨지지 않도록 처리
		request.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"));
		
		if (path.equals("/login.us")) {
			System.out.println("login.us 요청 처리");
			
			//1. client에서 넘긴 파라미터 변수 값을 받아서 변수에 저장
			String u_id = request.getParameter("u_id");
			String u_password = request.getParameter("u_password");
			
			//2. 넘겨 받은 값을 UsersDTO에 저장
			UsersDTO dto = new UsersDTO();
			dto.setU_id(u_id);
			dto.setU_password(u_password);
			
			//3. UsersDAO의 login(dto)
			UsersDAO dao = new UsersDAO();
			
			//리턴받을 UsersDTO 선언
			UsersDTO users = new UsersDTO();
			
			users = dao.login(dto);
			
			//users가 null일 경우: 인증 실패, 그렇지 않을 경우: 인증 성공
			if (users == null) {	//인증 실패
				System.out.println("인증 실패했습니다.");
				response.sendRedirect("LoginForm.jsp");
			
			} else {				//인증 성공
				//세션의 변수의 값을 할당하고 view 페이지로 전송
				System.out.println("인증 성공했습니다.");
				
				HttpSession session = request.getSession();
				session.setAttribute("u_id",users.getU_id());
				//session.setAttribute("role", users.getRole());
				
				response.sendRedirect("LoginForm.jsp");
			}
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
