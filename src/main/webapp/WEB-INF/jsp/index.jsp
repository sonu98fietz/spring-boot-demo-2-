<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css"
	href="webjars/bootstrap/4.4.1/css/bootstrap.min.css" />
<c:url value="/css/main.css" var="jstlCss" />
<link href="${jstlCss}" rel="stylesheet" />

</head>
<body>
	<div class="container">
		<header class="jumbotron">
			<h2>Spring MVC + JSP + JPA + Spring Boot 2</h2>
		</header>
		<div class="card-body">
			<div class="container my-5">
				<p class="my-5">
					<a href="/addUser" class="btn btn-success"> Add User</a>
				</p>
				<h3>View Users</h3>
				<table class="table table-striped table-responsive-md">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Email Id</th>
							<th>Phone No</th>
							<th>Update</th>
							<th>Remove</th>
						</tr>
						<c:forEach var="user" items="${users}">
						<!-- construct an "update" link with user id -->
							<c:url var="updateLink" value="/update">
								<c:param name="id" value="${user.id}" />
							</c:url>

							<!-- construct an "delete" link with user id -->
							<c:url var="deleteLink" value="/delete">
								<c:param name="id" value="${user.id}" />
							</c:url>
							<tr>
								<td>${user.id}</td>
								<td>${user.name}</td>
								<td>${user.emailId}</td>
								<td>${user.phoneNo}</td>
								<!-- Edit user -->
								<td><a href="${updateLink}" class="btn btn-success">Edit</a></td>

								<!-- Confirm delete user -->
								<td><a href="${deleteLink}" class="btn btn-success"
									onclick="if(!(confirm('Are you sure you want to delete this user?'))) return false">
										Delete</a></td> 
							</tr>
						</c:forEach>
				</table>
			</div>
		</div>

	</div>

	<script type="text/javascript"
		src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>