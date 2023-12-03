<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Example</title>
</head>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.io.IOUtils" %>
<%@ page import="java.util.List" %>


<%
    String jdbcUrl = "jdbc:mysql://localhost:3306/your_database";
    String dbUser = "your_username";
    String dbPassword = "your_password";

    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/project" , "root" , "");

        if (ServletFileUpload.isMultipartContent(request)) {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            try {
                List<FileItem> items = upload.parseRequest(request);
                String field1 = null;
                String field2 = null;
                byte[] image = null;

                for (FileItem item : items) {
                    if (item.isFormField()) {
                        if ("address".equals(item.getFieldName())) {
                            field1 = item.getString("UTF-8");
                        } else if ("des".equals(item.getFieldName())) {
                            field2 = item.getString("UTF-8");
                        }
                    } else {
                        image = item.get();
                    }
                }

                // Insert data into MySQL
                String sql = "INSERT INTO problems (field1, field2, image) VALUES (?, ?, ?)";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, field1);
                preparedStatement.setString(2, field2);
                preparedStatement.setBytes(3, image);
                preparedStatement.executeUpdate();

                out.println("<p>Data inserted successfully!</p>");

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<form action="" method="post" enctype="multipart/form-data">
    <label for="field1">Field 1:</label>
    <input type="text" name="address" required><br>

    <label for="field2">Field 2:</label>
    <input type="text" name="des" required><br>

    <label for="image">Image:</label>
    <input type="file" name="image" accept="image/*" required><br>

    <input type="submit" value="Submit">
</form>

</body>
</html>
