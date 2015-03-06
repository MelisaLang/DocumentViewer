package com.qualcomm.it.docviewer

import grails.rest.Resource

@Resource(uri='/documents')
class Document {

	String author
	Date pubDate
	String docDescription
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		author blank:false
		docDescription blank:false
		pubDate nullable:true
    }
	
	static mapping = {
		autoTimestamp true
	}
}
