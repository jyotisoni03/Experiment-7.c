import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class AttendanceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String status = request.getParameter("status");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/testdb", "root", "your_password");

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO attendance(student_name, status) VALUES (?, ?)");
            ps.setString(1, name);
            ps.setString(2, status);
            ps.executeUpdate();

            con.close();
            response.sendRedirect("attendance.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
