<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.servlet.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

</head>
<body class="bg-light">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="card mt-3">
					<div class="card-body">

						<p class="text-center fs-3">Upload Videos</p>

						<%
						String msg = (String) session.getAttribute("msg");
						if (msg != null) {
						%>
						<h4 class="text-center text-success"><%=msg%>
						</h4>
						<%
						session.removeAttribute("msg");
						}
						%>
						<form method="post" action="upload" enctype="multipart/form-data">

							<div class="mb-3">
								<label>Video</label> <input type="file" name="files"
									class="form-control">
							</div>

							<div class="mb-3">
								<label>Remark</label> <input type="text" name="remark"
									class="form-control">
							</div>

							<div class="text-center">
								<button class="btn btn-primary">Upload</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>

		<table class="table mt-4 ">
			<thead>
				<tr>
					<th scope="col">Videos</th>
					<th scope="col">Remark</th>
					<th scope="col">Action</th>

				</tr>
			</thead>
			<tbody>
				<%
				Connection conn = DBconnect.getconn();

				PreparedStatement ps = conn.prepareStatement("select * from img_details");
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
				%>
				<tr>
					<%-- <th scope="row"><img alt=""
						src="images/<%=rs.getString("img_name")%>"></th>
					<td><%=rs.getString("remark")%></td> --%>
					<th scope="row"><video width="360" height="250" controls>
							<source src="images/<%=rs.getString("img_name")%>"
								type="video/mp4">
							<source src="movie.ogg" type="video/ogg">
						</video></th>
					<td><%=rs.getString("remark")%></td>
					<td><a href="" class="btn btn-primary btn-sm"> Download</a></td>
					



				</tr>
				<%-- <tr>
				<th scope="row"><img alt="" width="380" height="270"
						src="images/<%=rs.getString("img_name")%>"></th>
					<td><%=rs.getString("remark")%></td>
				</tr> --%>
				<%
				}
				%>



			</tbody>
		</table>

	</div>





	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>
</html>