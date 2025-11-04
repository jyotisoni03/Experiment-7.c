<%@ page import="java.sql.*" %>
<html>
<head><title>Student Attendance Portal</title></head>
<body>
    <h2>Mark Attendance</h2>
    <form action="AttendanceServlet" method="post">
        Student Name: <input type="text" name="name" required><br><br>
        Status: 
        <select name="status">
            <option value="Present">Present</option>
            <option value="Absent">Absent</option>
        </select><br><br>
        <input type="submit" value="Submit">
    </form>

    <h2>Attendance Records</h2>
    <table border="1">
        <tr><th>ID</th><th>Student Name</th><th>Status</th></tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/testdb", "root", "your_password");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM attendance");
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("student_name") %></td>
                        <td><%= rs.getString("status") %></td>
                    </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>
