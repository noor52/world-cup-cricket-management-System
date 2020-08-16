<%--
  Created by IntelliJ IDEA.
  User: bashir
  Date: 2/19/2020
  Time: 5:46 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<title>Edit team</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
</head>
<body>


<section class="content">
	<div class="container-fluid">
		<div class="row">
			<%--left Menu START--%>
			<div class="left-menu-section col-lg-2 col-md-3 col-sm-4" >

				<jsp:include page="../includes/homemenu.jsp"/>

			</div>
			<%--left Menu END--%>

			<%--content body section START--%>
			<div class="right-body-section col-lg-10 col-md-9 col-sm-8">

				<%--nav section START--%>
				<div class="row">
					<div class="col-sm-12">
						<nav class="navbar navbar-light bg-light justify-content-between">
							<a class="navbar-brand">ICC WEB</a>
							<a href="${pageContext.request.contextPath}/logout" class="btn btn-primary">Logout</a>
						</nav>
					</div>
				</div>
				<%--nav section END--%>

				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-12">
						<div class="card" style="margin-top: 10px">

							<div class="card-body">
								<h5 class="card-title">Edit team information</h5>

								<form:form  class="form-group" action="${pageContext.request.contextPath}/team/edit" method="post" modelAttribute="team" >

									<form:input type="hidden" path="id" value="${team.id}" />

									<div class="form-group row">
										<div class="col-sm-12">
											<label for="team_name">Name</label>
											<form:input id="team_name" class="form-control" path="name"/>
										</div>

									</div>
									<div class="form-group row">
										<div class="col-sm-12">
											<label for="country_name">Country</label>
											<form:input id="country_name" class="form-control" path="countryName" readonly="true"/>
										</div>
									</div>

									<form:input path="countryId" type="hidden" value="${team.countryId}" />

									<input class="btn btn-primary float-right" type="submit" name="submit" value="Save team" style="margin-top: 10px"/>

								</form:form>
							</div>
						</div>

					</div>
				</div>



				<%--footer START --%>
				<%--footer END--%>
			</div>
		</div>
		<%--content body section END--%>

	</div>
</section>


</body>
</html>

