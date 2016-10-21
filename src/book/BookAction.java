package book;

import java.sql.*;
import java.util.ArrayList;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import db.DBConnection;

public class BookAction extends ActionSupport {
	private String authorID = null;
	private String name=null;
	private String country=null;
	private int age=0;
	
	private static final long serialVersionUID = 1L;
	
	private String authorname;
	private String title;
	private String ISBN;
	
	public String getAuthorname() {
        return authorname;
    }
	public void setAuthorname(String authorname) {
        this.authorname = authorname;
    }
	public String getTitle(){
		return title;
	}
	public void setTitle(String title){
		this.title=title;
	}
	public String getISBN(){
		System.out.println(ISBN);
		return ISBN;
	}
	public void setISBN(String ISBN){
		this.ISBN=ISBN;
	}
	
	public String search(){
		Connection conn = DBConnection.getConn();
		String sql = "select * from author where Name='"+getAuthorname()+"'";
		ArrayList<String> booklist;
		try { 
			Statement ps=conn.createStatement();
			ResultSet rS = ps.executeQuery(sql);
			if(!rS.next()){
				return "no author";
			}
			else{
				authorID=rS.getString("authorID");
				name=rS.getString("name");
				country=rS.getString("country");
				age=rS.getInt("age");
				booklist=getBookname(authorID);
				ServletActionContext.getRequest().setAttribute("name", name);
				ServletActionContext.getRequest().setAttribute("authorID", authorID);
				ServletActionContext.getRequest().setAttribute("age", age);
				ServletActionContext.getRequest().setAttribute("country", country);
				ActionContext.getContext().put("booklist", booklist);
				return "find";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "no author";
		}
	}
	public ArrayList<String> getBookname(String authorID){
		ArrayList<String> booklist = new ArrayList<String>();
		String temp = null;
		Connection conn = DBConnection.getConn();
		String sql1 = "select * from book where AuthorID='"+authorID+"'";
		try { 
			Statement ps=conn.createStatement();
			ResultSet rS = ps.executeQuery(sql1);
			while(true){
				if(!rS.next()) break;
				temp=rS.getString("Title");
				booklist.add(temp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		return booklist;
	}
	
	public String bookinfo(){
		String ISBN;
		String authorID;
		String publisher;
		double price;
		Date publishDate;
		Connection conn = DBConnection.getConn();
		String sql = "select * from book where Title='"+getTitle()+"'";
		try { 
			Statement ps=conn.createStatement();
			ResultSet rS = ps.executeQuery(sql);
			if(!rS.next()){
			}
			else{
				ISBN = rS.getString("ISBN");
				title=rS.getString("title");
				authorID=rS.getString("authorID");
				publisher=rS.getString("publisher");
				publishDate=rS.getDate("publishDate");
				price=rS.getDouble("price");
				ServletActionContext.getRequest().setAttribute("title", title);
				ServletActionContext.getRequest().setAttribute("ISBN", ISBN);
				ServletActionContext.getRequest().setAttribute("authorID", authorID);
				ServletActionContext.getRequest().setAttribute("publisher", publisher);
				ServletActionContext.getRequest().setAttribute("publishDate", publishDate);
				ServletActionContext.getRequest().setAttribute("price", price);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "display";
	}
	
	public String delete(){
		
		Connection conn = DBConnection.getConn();
		String sql = "delete from book where ISBN='"+getISBN()+"'";
		System.out.println(sql);
		try { 
			Statement ps=conn.createStatement();
			int rS = ps.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "dele";
	}
}
