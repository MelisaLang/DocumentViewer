
<%@ page import="com.qualcomm.it.docviewer.Document" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-document" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-document" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list document">
			
				<g:if test="${documentInstance?.documentId}">
				<li class="fieldcontain">
					<span id="documentId-label" class="property-label"><g:message code="document.documentId.label" default="Document Id" /></span>
					
						<span class="property-value" aria-labelledby="documentId-label"><g:fieldValue bean="${documentInstance}" field="documentId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="document.author.label" default="Author" /></span>
					
						<span class="property-value" aria-labelledby="author-label"><g:fieldValue bean="${documentInstance}" field="author"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.docDescription}">
				<li class="fieldcontain">
					<span id="docDescription-label" class="property-label"><g:message code="document.docDescription.label" default="Doc Description" /></span>
					
						<span class="property-value" aria-labelledby="docDescription-label"><g:fieldValue bean="${documentInstance}" field="docDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.pubDate}">
				<li class="fieldcontain">
					<span id="pubDate-label" class="property-label"><g:message code="document.pubDate.label" default="Pub Date" /></span>
					
						<span class="property-value" aria-labelledby="pubDate-label"><g:formatDate date="${documentInstance?.pubDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="document.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${documentInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="document.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${documentInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:documentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${documentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
