package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bbs.Bbs;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://175.114.255.210:3306/bbs";
			String dbID = "tester";
			String dbPassword = "P@ssw0rd";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) 
	{
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		
		try 
		{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			rs = pstmt.executeQuery();
			if(rs.next()) 
			{
				if(rs.getString(1).contentEquals(userPassword)) {
					return 1; // �α��� ����
				}
				else
				{
					return 0; // ��й�ȣ ����ġ
				}
			}
			return -1; // ���̵� ����
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return -2; // ������ ���̽� ����
	}
	
	public int join(User user)
	{
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?, ?, ?, 0, 0)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserType());
			pstmt.setString(5, user.getUserEmail());
			
			if(user.getUserRegion() == null) {
				System.out.println( "kim2" + user.getUserMachine());
				System.out.println( "kim2" + user.getMachineWidth());
				System.out.println( "kim2" + user.getUserRegion());
				pstmt.setString(6, "none" );
				pstmt.setInt(7, 9999 );
				pstmt.setString(8, "none" );
			}else {
				pstmt.setString(6, user.getUserMachine());
				pstmt.setInt(7, user.getMachineWidth());
				pstmt.setString(8, user.getUserRegion());				
			}
			
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		
		}
		return -1; //������ ���̽� ����
	}
	public User getUser(String userID) {
		String SQL = "SELECT * FROM USER WHERE userID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			rs= pstmt.executeQuery();
			if(rs.next())
			{
				User user = new User();
				user.setUserID(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserType(rs.getString(4));
				user.setUserEmail(rs.getString(5));
				user.setUserMachine(rs.getString(6));
				
				user.setMachineWidth(rs.getInt(7));
				user.setUserRegion(rs.getString(8));
				user.setRequestPoint(rs.getInt(9));
				user.setResolvePoint(rs.getInt(10));
				return user;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null; // �����ͺ��̽� ����
	}

	
	public int searchscore(string userid) {
		int score;
		string SQL = "SELECT requestPoint FROM user WHERE userID = userid;";
	
		try
		{
			pstmt = conn.prepareStatement(SQL);
			score = pstmt.executeQuery();
			conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
		return score;
	}
		
	public void gainscore(string userid, int score)
	{
		score = score +1;
		string SQL = "UPDATE user SET requestPoint = ? WHERE userID = userid;";
	
		try
		{			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, score);
			rs = pstmt.executeQuery();
			conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
		return 0;
	}
}
