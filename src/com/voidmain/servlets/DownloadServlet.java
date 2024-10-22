package com.voidmain.servlets;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.voidmain.service.SimpleFTPClient;
import com.voidmain.util.Constants;

@WebServlet("/DownloadServlet")
public class DownloadServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		String fileName=request.getParameter("filename");
		
		if (FileDownload.fileDownload(Constants.ENCRYPTION_PATH+fileName)) {

			FileInputStream fis=new FileInputStream(Constants.ENCRYPTION_PATH+fileName);

			FileOutputStream fos=new FileOutputStream(Constants.FILES_PATH+"new"+fileName);

			try {
				SimpleFTPClient.decrypt(fis, fos);
			} catch (Throwable e) {
				e.printStackTrace();
			}

			response.setContentType("text/html");    
			response.setContentType("APPLICATION/OCTET-STREAM");   
			response.setHeader("Content-Disposition","attachment; filename=\"" +fileName+ "\"");   

			FileInputStream fileInputStream = new FileInputStream(Constants.FILES_PATH+"new"+fileName);  

			int i;   
			while ((i=fileInputStream.read()) != -1) {  
				out.write(i);   
			}   
		
			fileInputStream.close();   
			out.close();   

		} else {
			response.sendRedirect("viewdocuments.jsp?status=failed");
		}
	}
}
