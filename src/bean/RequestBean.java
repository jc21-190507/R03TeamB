package bean;



public class RequestBean implements java.io.Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String reception_id;
	private String student_no;
	private String reception_date;
	private String division_flag;
	private String next_flag;
	
	public String getReception_id() {
		return reception_id;
	}
	
	public String getStudent_no() {
		return student_no;
	}
	
	public String getReception_date() {
		return reception_date;
	}
	
	public String getDivision_flag() {
		return division_flag;
	}
	
	public String getNext_flag() {
		return next_flag;
	}
	
	public void setReception_id(String reception_id) {
		this.reception_id = reception_id;
	}
	
	public void setStudent_no(String student_no) {
		this.student_no =student_no;
	}
	
	public void setReception_date(String reception_date) {
		this.reception_date = reception_date;
	}
	
	public void setDivision_flag(String division_flag) {
		this.division_flag = division_flag;
	}
	public void setNext_flag(String next_flag) {
		this.next_flag = next_flag;
	}
}
	