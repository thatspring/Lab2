package db;
import java.sql.*;
import com.mysql.*;
public class DBConnection {
	static Connection con = null;
	static Statement stat = null;
	static ResultSet rs = null;
	public static  Connection getConn(){
			
			try {
				String username = "book";
				String password = "123456";
				String dbUrl = "jdbc:mysql://njcsonstnigo.rds.sae.sina.com.cn:10677/bookdb?useSSL=false";
				System.out.println(dbUrl);
			    Class.forName("com.mysql.jdbc.Driver");
			    con = DriverManager.getConnection(dbUrl, username, password);
			    System.out.println("连接成功！");
			    // ...
			} catch(ClassNotFoundException e)
			{
				e.printStackTrace();
			}catch(SQLException e){
				e.printStackTrace();
			}   
		return con;
	}        
	public void dbClose(){
		try{            
			if(rs!=null)
			{ 
				rs.close();
				rs=null;
			}
			if(stat!=null){
				stat.close();
				stat=null;
			}
			if(con!=null)
			{
				con.close();
				con=null;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	public static ResultSet executeQuery(String sql) {
		// TODO Auto-generated method stub
		try {
			rs = stat.executeQuery(sql);
		} catch (Exception e) {
		// TODO: handle exception
			rs = null;
		}
		return rs;
	}
	public static int executeUpdate(String sql) {
		try {
			stat.executeUpdate(sql);
			return 0;
		} catch (Exception e) {
		// TODO: handle exception
		}
		return -1;
	}
	
}
