<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spring MVC Form</title>
<link rel="stylesheet" type="text/css"
	href="webjars/bootstrap/4.4.1/css/bootstrap.min.css" />
<c:url value="/css/main.css" var="jstlCss" />
<link href="${jstlCss}" rel="stylesheet" />

</head>
<body>
<div class="container">

	<div class="jumbotron">
	<h2 class="text-center">Spring MVC Boot with JSP</h2>
	
	</div>
	<h3> ${formState}</h3>
		<div class="card">
			<div class="card-body">
				<div class="col-md-10">
					<form:form action="add" cssClass="form-horizontal" method="post" modelAttribute="user">
					
					<!-- need user id -->
					<form:hidden path="id"/>
					
					
						<div class="row">
							<div class="form-group col-md-8">
								<label for="name" class="col-form-label">Name</label> 
								<form:input path="name" cssClass="form-control" id="name" placeholder="Name" /> 
							</div>
							<div class="form-group col-md-8">
								<label for="emailId" class="col-form-label">Email</label> 
								<form:input path="emailId" cssClass="form-control" id="emailId" placeholder="Email Id" /> 
							</div>

							<div class="form-group col-md-8">
								<label for="phoneNo" class="col-form-label">Phone No</label> 
								<form:input path="phoneNo" cssClass="form-control" id="phoneNo" placeholder="PhoneNo" />
							</div>

							<div class="form-group col-md-8">
								<button type="submit" class="btn btn-primary">Submit</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="/list"><input type="button" class="btn btn-primary" value="Cancel"></a>
							</div>
							
							<!-- <div class="form-group col-md-8"></div> -->

						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>