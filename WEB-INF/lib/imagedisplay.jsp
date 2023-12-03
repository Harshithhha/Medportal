<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Base64" %>

<%
    String url = "jdbc:mysql://your_mysql_server:3306/your_database";
    String user = "your_username";
    String password = "your_password";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        
        Connection  connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/project" , "root" , "");
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * FROM problems");

        while (resultSet.next()) {
            String text1 = resultSet.getString("field1");
            String text2 = resultSet.getString("field2");
            Blob blob = resultSet.getBlob("image");
            byte[] imageData = blob.getBytes(1, (int) blob.length());
            String base64Image = Base64.getEncoder().encodeToString(imageData);

%>
            <div>
                <p>Text Field 1: <%= text1 %></p>
                <p>Text Field 2: <%= text2 %></p>
                <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Image"/>
            </div>
<%
        }

        connection.close();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
%>
