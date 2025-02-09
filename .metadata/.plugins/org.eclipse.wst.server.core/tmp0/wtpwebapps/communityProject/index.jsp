<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<%@ page import="java.sql.*"%>



<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
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

String id = null;
String name = null;
String writer = null;
String dtm = null;
String mDtm = null;
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
        id = rs.getString("board_id");
        name = rs.getString("board_name");
        writer = rs.getString("board_writer");
        dtm  = rs.getString("board_register_dtm");
        mDtm =  rs.getString("board_modify_dtm");
        
    }
    
    
}catch (SQLException e) {
    e.printStackTrace();
} catch (ClassNotFoundException e) {
    e.printStackTrace();
}




%>
<script>
	
</script>
<body>
	<table width="100%"
		class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>#번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>수정일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="" var="board">
				<tr class="odd gradeX">
					<td><c:out value= "<%= id%>" /> <%= id%></td>
					<td><c:out value="<%= name%>" /> <%= name%></td>
					<td><c:out value="" /><%= writer %></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="" /><%= dtm %></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="" /><%= mDtm %></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
