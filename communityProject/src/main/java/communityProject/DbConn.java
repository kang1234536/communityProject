package communityProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConn {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		dbConnection();
	}
	
	public static void dbConnection() {
        Connection connection = null;
        // DB Driver
	    String dbDriver = "org.postgresql.Driver"; 
	    // DB URL
	    // IP:PORT/스키마 
	    String dbUrl = "jdbc:postgresql://cfljfb1quhols5.cluster-czrs8kj4isg7.us-east-1.rds.amazonaws.com:5432/d65eoloovved56?user=u37m7gk2uqdr49&password=pa7760e461993f6fc7dd1f5afc4466283266a56f5ac19362f3139c85875861d0f";
	    	
	    // DB ID/PW
	    String dbUser = "u37m7gk2uqdr49";
	    String dbPassword = "pa7760e461993f6fc7dd1f5afc4466283266a56f5ac19362f3139c85875861d0f";
	    Statement stmt = null;

	    
	    


        try {
        		
	            Class.forName(dbDriver);
	            connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

	            stmt = connection.createStatement();
	            String query="select * from board";
	            
	            
	            PreparedStatement pstmt = connection.prepareStatement(query);
	            ResultSet rs = pstmt.executeQuery();
	            
	            if(rs.next()){
	            	System.out.println("DB Connection [성공]");
		            System.out.println(rs.getString("board_name"));
	            }
	            
	            
	        }catch (SQLException e) {
	            e.printStackTrace();
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
       
    }

}
