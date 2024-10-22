<!DOCTYPE HTML>
<%@page import="com.voidmain.dao.DAO"%>
<%@page import="com.voidmain.pojo.Team"%>
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
					<h3>View Teams</h3>
					<%
						}
					%>

					<br /> <br /> <br /> <br />
					<table style="width: 100%; border-spacing: 0;">
						<tr>
							<th>Team ID</th>
							<th>Name</th>
							<th>Speciality</th>
							<th>View Patients</th>
							<th>Add Patients</th>

						</tr>
						<%
							List<Team> teams = DAO.getTeams();

							for (Team team : teams) {

								if (team.getHospitalid().equals(username)) {
						%>
						<tr>
							<td><%=team.getTeamId()%></td>
							<td><%=team.getName()%></td>
							<td><%=team.getSpeciality()%></td>
							<td><a href="viewpatients.jsp?teamId=<%=team.getTeamId()%>">View Patients</a></td>
							<td><a href="addpatient.jsp?teamId=<%=team.getTeamId()%>">Add Patients</a></td>
						</tr>
						<%
							   }
							}
						%>
					</table>
				</div>
			</div>
		</div>
	
	</div>
</body>
</html>
