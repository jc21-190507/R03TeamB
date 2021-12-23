package m03_Inventorylist;

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


/**
 * Servlet implementation class RequestManagementServlet
 */
@WebServlet("/m03_InventoryList/InventoryListServlet")
public class InventoryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InventoryListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			List<bean.InventoryListBean> list = new ArrayList<bean.InventoryListBean>();
			
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource)ic.lookup("java:/comp/env/jdbc/teamb");
			Connection con = ds.getConnection();
			PreparedStatement st = con.prepareStatement("select r.reception_id , s.email , r.reception_date from Reception as r join Student as s on r.student_no = s.student_no join Division as d on r.division_id = d.division_id");
			ResultSet rs = st.executeQuery();
			System.out.println("start");
			while(rs.next()) {
			bean.InventoryListBean IBean = new bean.InventoryListBean();
			
			IBean.setReception_id(rs.getString("reception_id"));
			IBean.setEmail(rs.getString("Email"));
			IBean.setReception_date(rs.getString("reception_date"));
			
			
			list.add(IBean);
			}
			st.close();
			con.close();
			
			request.setAttribute("list", list);
			request.getRequestDispatcher("/WEB-INF/jsp/InventoryList.jsp").forward(request, response);
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
