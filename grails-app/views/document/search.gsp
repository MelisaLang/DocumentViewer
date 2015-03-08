<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
	<meta name="layout" content="main"/>
	<title>Search DocumentViewer</title>
</head>
<body>
	<formset>
		<legend>Search for Documents</legend>
		<g:form action="results">
			<label for="loginId">Document ID</label>
			<g:textField name="documentId" />
			<g:submitButton name="search" value="Search"/>
		</g:form>
	</formset>
</body>
</html>