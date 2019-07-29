package com.green.bank.database;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.TimeZone;

public class JDBC_Connect {
	private Connection connection = null;

	public Connection getConnection() throws SQLException {
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/cias?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
			
			
			
		} catch (ClassNotFoundException e) {

			System.out.println("Where is your JDBC Driver?");
			e.printStackTrace();

		}

		return connection;

	}

}
