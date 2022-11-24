package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * author  Yasith C Bandara
 * created 11/23/2022 - 2:22 PM
 * project Hello_Java_EE
 */

@WebServlet(urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String cusId = req.getParameter("cusId");
        String cusName = req.getParameter("cusName");
        String cusAddress = req.getParameter("cusAddress");
        double cusSalary = Double.parseDouble(req.getParameter("cusSalary"));


        /*DB Connection*/

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/thogakade", "root", "1234");
            PreparedStatement pstm = connection.prepareStatement("INSERT INTO customer VALUES (?,?,?,?)");

            pstm.setString(1,cusId);
            pstm.setString(2,cusName);
            pstm.setString(3,cusAddress);
            pstm.setDouble(4,cusSalary);

            boolean b = pstm.executeUpdate()>0;
            resp.getWriter().write("<h1>"+b+"</h1>");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        /*DB Connection*/

    }
}
