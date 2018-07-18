<%@ page import="org.springframework.security.core.AuthenticationException" %>
<%@ page import="org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter" %>
<%@ page import="org.springframework.security.oauth2.common.exceptions.UnapprovedClientAuthenticationException" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:security="http://www.springframework.org/security/tags" xmlns:spring="http://www.springframework.org/tags" xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
  <title>Sparklr</title>
  <link type="text/css" rel="stylesheet" href="<c:url value="/style.css"/>"/>
</head>

<body>

	<div class="container">
		<h1>Sparklr</h1>

		
		<c:remove scope="session" var="SPRING_SECURITY_LAST_EXCEPTION" />

		<security:authorize ifAllGranted="ROLE_USER">
			<h2>Please Confirm</h2>

			<p>
				You hereby authorize "
				<c:out value="${client.clientId}" />
				" to access your protected resources.
			</p>

			<form id="confirmationForm" name="confirmationForm"
				action="<%=request.getContextPath()%>/oauth/authorize" method="post">
				<input name="user_oauth_approval" value="true" type="hidden" />
				<ul class="list-unstyled">
					<c:forEach items="${scopes}" var="scope">
 						<c:set var="approved">
							<c:if test="${scope}"> scope</c:if>
 						</c:set>
 						<c:set var="denied"> 
							<c:if test="${!scope}"> checked</c:if>
 						</c:set> 
 						<li> 
 							<div class="form-group"> 
								${scope}: <input type="radio" name="scope.read"
									value="true">Approve</input> <input type="radio"
									name="${scope}" value="false" ${denied}>Deny</input>
 							</div> 
 						</li>
 					</c:forEach>
				</ul>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<button class="btn btn-primary" type="submit">Submit</button>
			</form>

		</security:authorize>

		<div class="footer">
			Sample application for <a
				href="http://github.com/spring-projects/spring-security-oauth"
				target="_blank">Spring Security OAuth</a>
		</div>

	</div>

</body>
</html>