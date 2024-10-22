<!DOCTYPE HTML>
<%@page import="com.voidmain.pojo.Transaction"%>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.dao.DAO"%>
<%@page import="com.voidmain.pojo.Patient"%>
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

					<li class="selected"><a href="hospitalhome.jsp">Home</a></li>
					<li><a href="sendrequest.jsp">Send Requests</a></li>
					<li><a href="viewrequestedpatients.jsp">View Requested Patients</a></li>
					<li><a href="logout.jsp">Logout</a></li>

				</ul>
			</div>
		</div>
		<div id="content_header"></div>
		<div id="site_content">
			<div id="sidebar_container">
				<br /> <br /> <br /> <br />
				<div class="sidebar">
					<div class="sidebar_top"></div>
					<div class="sidebar_item">
						<h3>Useful Links</h3>
						<ul>
							<li class="selected"><a href="hospitalhome.jsp">Home</a></li>
							<li><a href="sendrequest.jsp">Send Requests</a></li>
							<li><a href="logout.jsp">Logout</a></li>
						</ul>
					</div>
					<div class="sidebar_base"></div>
				</div>
			</div>
			<div id="content">
				<div class="form_settings">

					<%
						String username = session.getAttribute("username").toString();
						String teamId = request.getParameter("teamId");
							
						if(teamId!=null)
						{
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
					<h3>View Patients</h3>
					<%
						}
					%>

					<br /> <br /> <br /> <br />
					<table style="width: 100%; border-spacing: 0;">

						<tr>
							<th>Patient ID</th>
							<th>Name</th>
							<th>Age</th>
							<th>Gender</th>
							<th>Mobile</th>
							<th>Address</th>
							<th>Team</th>
							<th>Add Treatment</th>
							<th>View Treatment</th>
							<th>Delete</th>

						</tr>
						<%
							List<Patient> patients = DAO.getPatients();

							for (Patient patient : patients) {
								
								System.out.println(patient);
								
								if (patient.getTeamId() == Integer.parseInt(teamId)) {
						%>
						<tr>
							<td><%=patient.getPatientId()%></td>
							<td><%=patient.getName()%></td>
							<td><%=patient.getAge()%></td>
							<td><%=patient.getGender()%></td>
							<td><%=patient.getPhone()%></td>
							<td><%=patient.getAddress()%></td>
							<td><%=patient.getTeamId()%></td>
							<td><a
								href="addtreatment.jsp?patientId=<%=patient.getPatientId()%>">Add
									Treatment</a></td>
							<td><a
								href="viewtreatment.jsp?patientId=<%=patient.getPatientId()%>">View
									Treatment</a></td>
							<td><a
								href="viewpatients.jsp?patientId=<%=patient.getPatientId()%>&tid=<%=teamId%>">Delete</a></td>
						</tr>
						<%
							}
							}
						%>
					</table>
					
					<%
						} 
					%>

					<%
						String patientId = request.getParameter("patientId");
					    String tid = request.getParameter("tid");

						if (patientId != null && tid!=null) {
							if (HibernateTemplate.deleteObject(Patient.class, patientId) == 1) {
								response.sendRedirect("viewpatients.jsp?teamId="+tid+"&status=success");
							} else {
								response.sendRedirect("viewpatients.jsp?teamId="+tid+"&status=success");
							}

						}
					%>

				</div>
			</div>
		</div>
	
	</div>
</body>
</html>
