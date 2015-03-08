<%@ page import="com.qualcomm.it.docviewer.Document" %>



<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'documentId', 'error')} required">
	<label for="documentId">
		<g:message code="document.documentId.label" default="Document Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="documentId" maxlength="64" required="" value="${documentInstance?.documentId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="document.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="author" maxlength="64" required="" value="${documentInstance?.author}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'docDescription', 'error')} required">
	<label for="docDescription">
		<g:message code="document.docDescription.label" default="Doc Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="docDescription" cols="40" rows="5" maxlength="256" required="" value="${documentInstance?.docDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'pubDate', 'error')} ">
	<label for="pubDate">
		<g:message code="document.pubDate.label" default="Pub Date" />
		
	</label>
	<g:datePicker name="pubDate" precision="day"  value="${documentInstance?.pubDate}" default="none" noSelection="['': '']" />

</div>

