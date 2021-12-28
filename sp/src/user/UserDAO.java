package user;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/*import com.sun.xml.internal.ws.wsdl.writer.document.OpenAtts;*/





public class UserDAO {
	

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/StudyDB";
			String dbID = "root";
			String dbPassword = "mysql";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;
				}
				else
					return 0; 
			}
			return -1; 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; 
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	public User getSdmember(String id) {
		User user = new User();
		PreparedStatement pstm = null;
		String query = "select * from user where userID=?;";
		

		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
			pstm.setString(1, id);
			
			ResultSet rs = pstm.executeQuery();
			if(rs.next()) {
				user.setUserID(rs.getString("userID"));
				user.setUserPassword(rs.getString("userPassword"));
				user.setUserName(rs.getString("userName"));
				user.setUserGender(rs.getString("userGender"));
				user.setUserEmail(rs.getString("userEmail"));
			}
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return user;
	}
public ArrayList<User> getDBList(){
		
		ArrayList<User> datas= new ArrayList<>();
		String query = "select * from user order by userID desc;";
		Statement stmt;
		ResultSet rs;
	
		try {
			
			stmt = conn.createStatement();
			rs= stmt.executeQuery(query);
			
			while(rs.next()) {
				User user = new User();
				
				user.setUserID(rs.getString("userID"));
				user.setUserPassword(rs.getString("userPassword"));
				user.setUserName(rs.getString("userName"));
				user.setUserGender(rs.getString("userGender"));
				user.setUserEmail(rs.getString("userEmail"));
				
				datas.add(user);
			}
			rs.close();
			stmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return datas;
	}


	/*	public int updateUser(User user) {
			PreparedStatement pstm = null;
			String query = "update user set userPassword=?, userName=?, userGender=?, userEmail=?, where userID =?;";
			int res=0;
						
			try {
				pstm=(PreparedStatement)conn.prepareStatement(query);
					
					pstm.setString(1, user.getUserPassword());
					pstm.setString(2, user.getUserName());
					pstm.setString(3, user.getUserGender());
					pstm.setString(4, user.getUserEmail());
					pstm.setString(5, user.getUserID());
				res=pstm.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				
			}
			return res;
		}*/
	
		
		
		
	public boolean isUser(String id, String pass) {
		PreparedStatement pstm = null;
		boolean res = false;
		String query = "select * from user where userID=? and userPassword =?;";
			
		
		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
			pstm.setString(1, id);
			pstm.setString(2, pass);
			
			ResultSet rs = pstm.executeQuery();
			res = rs.next();
			rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return res;
	
	}
	public int removeUser(String id) {
		PreparedStatement pstm = null;
		String query = "delete from user where userID= ?;";
		int res = 0;
		
		
		try {
			
			pstm = (PreparedStatement)conn.prepareStatement(query);
			pstm.setString(1, id);
			res = pstm.executeUpdate();			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return res;
	}

}



