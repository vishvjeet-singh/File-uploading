package com.servlet;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.annotation.WebServlet;

@WebServlet("/DBconnect")
public class DBconnect {

	
	private static Connection conn;

	public static Connection getconn() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 conn = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/upload_img","root","Kuku@123");

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return conn;
	}
}
