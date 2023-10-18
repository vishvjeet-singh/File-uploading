package com.servlet;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.tomcat.jni.FileInfo;

@WebServlet("/download")
public class DownloadFile extends HttpServlet {

	
	public static final int BUFFER_SIZE=1024*1000 ;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String filename= req.getParameter("fn");
		String path= getServletContext().getRealPath("")+"images" + File.separator + filename ;
		//System.out.println(path);
		
		File file =new File(path);
		OutputStream os=null;
		FileInputStream fis=null;
		
		
		resp.setHeader("Content-Disposition", String.format("attachment;filename=\"%s\"", file.getName()));
		resp.setContentType("application/octet.stream");
		
		if (file.exists()) {
			
			os = resp.getOutputStream();
			fis =new FileInputStream(file);
			byte[] bf=new byte[BUFFER_SIZE];
			int byteRead =-1;
			
			while((byteRead =fis.read(bf))!=-1)
			{
				os.write(bf,0,byteRead);
			}
			
			
			
		}else {
			System.out.println("file not exist"+filename);
		}

	}
	
	

}
