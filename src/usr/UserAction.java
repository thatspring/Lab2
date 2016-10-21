package usr;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import db.DBConnection;


@SuppressWarnings("serial")
public class UserAction extends ActionSupport {
	private String username;
	private String password;
	
	public String getUsername() {
        return username;
    }
	public String getPassword() {
        return password;
    }
	public void setUsername(String username) {
        this.username = username;
    }
	public void setPassword(String password) {
        this.password = password;
    }
	
	public String login(){
		
		String sql = "select * from userinfo where username='"+getUsername()+"' and password = '"+getPassword()+"'";
		
		try {
			Connection conn = DBConnection.getConn();
			Statement ps=conn.createStatement();
			ResultSet rS = ps.executeQuery(sql);
			if (rS.next()) {
				return "loginin";
			}
			else{
				return "loginout";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "loginout";
		}
	}
	public String regist() {
		String sql = "insert into userinfo(username,password) values('"+getUsername()+"','"+getPassword()+"')";
		int i = DBConnection.executeUpdate(sql);
		if (i > -1) {
		return "success";
		}
		return "error";
	}
	
    
}

