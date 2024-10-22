<!DOCTYPE HTML>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.dao.DAO"%>
<%@page import="com.voidmain.pojo.Transaction"%>
<%@page import="java.util.List"%>
<html>

<head>
<title>Hospital</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="style/style.css" />
</head>

<body>
	<div id="main">
		<div id="header">
			<div id="logo">
				<div id="logo_text">
					<br /> <br /> <center><font size="5" color="white">A Framework for a Cloud-Based Electronic Health Records System for Developing Countries</font></center>
							
				</div>
			</div>
			<div id="menubar">
				<ul id="menu">

					<li class="selected"><a href="patienthome.jsp">Home</a></li>
					<li><a href="viewrequest.jsp">View Requests</a></li>
					<li><a href="logout.jsp">Logout</a></li>

				</ul>
			</div>
		</div>
		<div id="content_header"></div>
		<div id="site_content">
			<div id="content">
				<div class="form_settings">

					<%
						String username = session.getAttribute("username").toString();
					%>
					<%
						String status = request.getParameter("status");

						if (status != null) {
					%>
					<h3>
						<%=status%>
					</h3>
					<%
						} else {
					%>
					<h3>View Requests</h3>
					<%
						}
					%>

					<br /> <br /> <br /> <br />
					<table style="width: 100%; border-spacing: 0;">

						<tr>
							<th>Transaction ID</th>
							<th>Patient ID</th>
							<th>Requested Hospital</th>
							<th>Date</th>
							<th>Status</th>
							<th>Approve</th>
							<th>Reject</th>
							<th>Delete</th>

						</tr>
						<%
							List<Transaction> transactions = DAO.getTransactions();

							for (Transaction transaction : transactions) {
								
								
								if(transaction.getPatientId().equals(username))
								{
						%>
						<tr>
							<td><%=transaction.getTransactionId()%></td>
							<td><%=transaction.getPatientId()%></td>
							<td><%=transaction.getRequestedHospital()%></td>
							<td><%=transaction.getDate()%></td>
							<td><%=transaction.getStatus()%></td>
							<td><a
								href="viewrequest.jsp?transactionId=<%=transaction.getTransactionId()%>&reqstatus=approved">Approve</a></td>
							<td><a
								href="viewrequest.jsp?transactionId=<%=transaction.getTransactionId()%>&reqstatus=rejected">Reject</a></td>
							<td><a
								href="viewrequest.jsp?transactionId=<%=transaction.getTransactionId()%>&reqstatus=delete">Delete</a></td>
						</tr>
						<%
								}
							    
							}
						%>
					</table>

					<%
						String transactionId = request.getParameter("transactionId");
						String reqStatus=request.getParameter("reqstatus");

						if (transactionId != null && reqStatus!=null) {
							
							if(reqStatus.equals("delete"))
							{
								if (HibernateTemplate.deleteObject(Transaction.class,Integer.parseInt(transactionId))== 1) {
									response.sendRedirect("viewrequest.jsp?status=success");
								} else {
									response.sendRedirect("viewrequest.jsp?status=failed");
								}
							}
							else
							{
								Transaction transaction=DAO.getTransactionById(Integer.parseInt(transactionId));
								
								transaction.setStatus(reqStatus);
								
								if (HibernateTemplate.updateObject(transaction)== 1) {
									response.sendRedirect("viewrequest.jsp?status=success");
								} else {
									response.sendRedirect("viewrequest.jsp?status=failed");
								}
							}
						}
					%>

				</div>
			</div>
		</div>
	
	</div>
</body>
</html>
