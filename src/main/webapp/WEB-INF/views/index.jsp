
<%--
  Created by IntelliJ IDEA.
  User: bashir
  Date: 2/15/2020
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>

<%--<jsp:include page="common/header.jsp" />--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<title>ICC Web</title>
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

				<jsp:include page="includes/homemenu.jsp"/>

			</div>
			<%--left Menu END--%>

			<%--content body section START--%>
			<div class="right-body-section col-lg-10 col-md-9 col-sm-8">

				<%--nav section START--%>
				<div class="row">
					<div class="col-sm-12">
						<nav class="navbar navbar-light bg-light justify-content-between">
							<a class="navbar-brand">ICC WEB</a>
							<a href="${pageContext.request.contextPath}/logout" class="btn btn-primary float-right">Logout</a>
						</nav>
					</div>
				</div>
				<%--nav section END--%>
				<div class="row">
					<div class="col-sm-12">
						<h2 style="margin-left: auto">Dashboard</h2>
					</div>

				</div>


				<div class="row">
					<div class="col-sm-4">
						<div class="card">
							<div class="card-header">Country</div>
							<div class="card-body">
								<h5 class="card-title">Total country: ${stat.totalCountry}</h5>
								<p class="card-text float-left">Active: ${stat.activeCountry}</p>
								<p class="card-text float-right">Inactive: ${stat.inActiveCountry}</p>
							</div>
						</div>
					</div>

					<div class="col-sm-4">
						<div class="card">
							<div class="card-header">Team</div>
							<div class="card-body">
								<h5 class="card-title">Total Team: ${stat.totalTeam}</h5>
								<p class="card-text float-left">Active: ${stat.activeTeam}</p>
								<p class="card-text float-right">Inactive: ${stat.inactiveTeam}</p>
							</div>
						</div>
					</div>

					<div class="col-sm-4">
						<div class="card">
							<div class="card-header">Coaching staff</div>
							<div class="card-body">
								<h5 class="card-title">Total coaching staff: ${stat.totalCoach}</h5>
								<p class="card-text float-left">Active: ${stat.activeCoach}</p>
								<p class="card-text float-right">Inactive: ${stat.inActiveCoach}</p>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4">
						<div class="card">
							<div class="card-header">Player</div>
							<div class="card-body">
								<h5 class="card-title">Total player: ${stat.totalPlayer}</h5>
								<p class="card-text float-left">Active: ${stat.activePlayer}</p>
								<p class="card-text float-right">Inactive: ${stat.inActivePlayer}</p>
							</div>
						</div>
					</div>

					<div class="col-sm-4">
						<div class="card">
							<div class="card-header">User</div>
							<div class="card-body">
								<h5 class="card-title">Total user: ${stat.totalUser}</h5>
								<p class="card-text float-left">Active: ${stat.activeUser}</p>
								<p class="card-text float-right">Inactive: ${stat.inActiveUser}</p>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4 col-md-6 col-sm-12">
						<div class="card" style="margin-top: 10px">
							<h5 class="card-header">Team member of Country </h5>
							<div class="card-body">

								<form:form  class="form-group" action="${pageContext.request.contextPath}/team/team-members" method="post" modelAttribute="country" >
									<form:select class="form-control" path="id" items="${countryList}" itemLabel="name" itemValue="id"/>
									<input class="btn btn-primary float-right" type="submit" name="submit" value="See members" style="margin-top: 10px"/>
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

<jsp:include page="common/footer.jsp" />