package m02_requestdetails;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import bean.RequestDetailsBean;

/**
 * Servlet implementation class RequestDetailsServlet
 */
@WebServlet("/m02_requestdetails/RequestDetailsServlet")
public class RequestDetailsServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			List<RequestDetailsBean> list = new ArrayList<RequestDetailsBean>();
			
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource)ic.lookup("java:/comp/env/jdbc/teamb");
			Connection con = ds.getConnection();
			PreparedStatement st = con.prepareStatement("select r.reception_id , r.reception_date, r.student_no, r.reception_date, s.name, s.birthday, r.school_grade, d.dept_name, c.certificate_name, rd.quantity , r.total_price from reception as r join reception_details as rd on r.reception_id = rd.reception_id join certificate as c  on rd.certificate_id = c.certificate_id join dept as d on r.dept_id = d.dept_id join student as s on r.student_no = s.student_no where r.reception_id = ?" );
		
			int  id  = Integer.parseInt(request.getParameter("id"));
			st.setInt(1,id);
			
			ResultSet rs = st.executeQuery();
			System.out.println("start");
			while(rs.next()) {
			RequestDetailsBean Rbean = new RequestDetailsBean();
			
			Rbean.setReception_id(rs.getString("reception_id"));
			Rbean.setStudent_no(rs.getString("student_no"));
			Rbean.setReception_date(rs.getString("reception_date"));
			Rbean.setName(rs.getString("name"));
			Rbean.setBirthday(rs.getString("birthday"));
			Rbean.setSchool_grade(rs.getString("school_grade"));
			Rbean.setDept_name(rs.getString("dept_name"));
			Rbean.setCertificate_name(rs.getString("certificate_name"));
			Rbean.setQuantity(rs.getString("quantity"));
			Rbean.setTotal_price(rs.getString("total_price"));
			
			list.add(Rbean);
			}
			
			st.close();
			con.close();
			
			request.setAttribute("list", list);
			request.getRequestDispatcher("/WEB-INF/jsp/RequestDetails.jsp").forward(request, response);
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
