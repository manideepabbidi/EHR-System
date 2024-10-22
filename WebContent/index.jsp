<!DOCTYPE HTML>
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
					<!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
					<li class="selected"><a href="index.jsp">Home</a></li>
					<li><a href="registration.jsp">Hospital Registration</a></li>
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
							<li class="selected"><a href="index.jsp">Home</a></li>
							<li><a href="registration.jsp">Hospital Registration</a></li>
						</ul>
					</div>
					<div class="sidebar_base"></div>
				</div>
			</div>
			<div id="content">

				<%
					String status=request.getParameter("status");
					
					if (status != null) {
				%>
				<h3> <%=status%> </h3>
				<%
					} else {
				%>
				<h3>Login Here</h3>
				<%
					}
				%>

				<div class="form_settings">

					<form action="LoginServlet">
						<p>
							<span>User Name</span><input class="contact" type="text"
								name="username" id="username" />
						</p>
						<p>
							<span>Password</span><input class="contact" type="password"
								name="password" id="password" />
						</p>
						
						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="submit" type="submit"
								name="contact_submitted" value="Login" />
						</p>
					</form>

				</div>
			</div>
		</div>
	</div>
</body>
</html>
