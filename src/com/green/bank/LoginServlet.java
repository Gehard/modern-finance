package com.green.bank;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.green.bank.database.JDBC_Connect;
import com.green.bank.model.AccountModel;

public class LoginServlet extends HttpServlet {
	String UserName, password;
	Connection conn;
	Statement stmt;
	Statement stmt1;
	AccountModel am = null;
	boolean pass_wrong = false;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserName = request.getParameter("UserName");
		password = request.getParameter("password");

		System.out.println(UserName);
		System.out.println(password);

		try {
			// Getting database connection
			JDBC_Connect connect = new JDBC_Connect();
			conn = connect.getConnection();

			stmt = conn.createStatement();
			stmt1 = conn.createStatement();

			ResultSet rs = stmt1.executeQuery(
					"select * from account where username ='" + UserName + "'" + "and password='" + password + "'");

			if (!rs.isBeforeFirst()) {
				request.setAttribute("isPassOK", "No");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			} else {
				while (rs.next()) {
					pass_wrong = true;
					// Setting all variables to model class
					am = new AccountModel();
					am.setAccount_no(rs.getString("ID"));
					am.setFirst_name(rs.getString("F_NAME"));
					am.setLast_name(rs.getString("L_NAME"));
					am.setAddress(rs.getString("ADDRESS"));
					am.setCity(rs.getString("CITY"));
					am.setBranch(rs.getString("BRANCH"));
					am.setPostalCode(rs.getString("postalCode"));
					am.setUsername(rs.getString("USERNAME"));
					am.setPassword(rs.getString("PASSWORD"));
					am.setPhone_number(rs.getString("PHONE"));
					am.setEmail(rs.getString("EMAIL"));
					am.setAccount_type(rs.getString("ACCOUNT_TYPE"));
					am.setReg_date(rs.getString("REG_DATE"));
					
					String account = rs.getString("ID");
					String name = rs.getString("F_NAME");
					String Lname = rs.getString("L_NAME");
					String address = rs.getString("ADDRESS");
					String city = rs.getString("CITY");
					String branch = rs.getString("BRANCH");
					String postalCode = rs.getString("postalCode");
				
					String username = rs.getString("USERNAME");
					String password = rs.getString("PASSWORD");
					String phone= rs.getString("PHONE");
					
					String email = rs.getString("EMAIL");
					String account_type = rs.getString("ACCOUNT_TYPE");
					String reg_date = rs.getString("REG_DATE");
					System.err.println(rs.getString("ID"));
					ResultSet rs1 = stmt.executeQuery("select * from amount where id ='" + am.getAccount_no() + "'");
					
					while (rs1.next()) {
						am.setAmount((rs1.getInt("AMOUNT")));
						
					}

					// Setting Session variable for current User
					HttpSession session = request.getSession();
					session.setAttribute("account", account);
					session.setAttribute("name", name);
					session.setAttribute("lname", Lname);
					session.setAttribute("address", address);
					session.setAttribute("city", city);
					session.setAttribute("branch", branch);
					session.setAttribute("postalCode", postalCode);
					session.setAttribute("username", username);
					session.setAttribute("password", password);
					session.setAttribute("phone", phone);
					
					session.setAttribute("email", email);
					session.setAttribute("account_type", account_type);
					session.setAttribute("reg_date", reg_date);
					session.setAttribute("userDetails", am);

					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					rd.forward(request, response);

				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
