package com.qualcomm.it.docviewer

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import static javax.servlet.http.HttpServletResponse.*

class DocumentController {

    static final int SC_UNPROCESSABLE_ENTITY = 422

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() { }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		response.setIntHeader('X-Pagination-Total', Document.count())
		render Document.list(params) as JSON
    }

    def save() {
        def documentInstance = new Document(request.JSON)
        def responseJson = [:]
        if (documentInstance.save(flush: true)) {
            response.status = SC_CREATED
            responseJson.id = documentInstance.id
            responseJson.message = message(code: 'default.created.message', args: [message(code: 'document.label', default: 'Document'), documentInstance.id])
        } else {
            response.status = SC_UNPROCESSABLE_ENTITY
            responseJson.errors = documentInstance.errors.fieldErrors.collectEntries {
                [(it.field): message(error: it)]
            }
        }
        render responseJson as JSON
    }

    def get() {
        def documentInstance = Document.get(params.id)
        if (documentInstance) {
			render documentInstance as JSON
        } else {
			notFound params.id
		}
    }

    def update() {
        def documentInstance = Document.get(params.id)
        if (!documentInstance) {
            notFound params.id
            return
        }

        def responseJson = [:]

        if (request.JSON.version != null) {
            if (documentInstance.version > request.JSON.version) {
				response.status = SC_CONFLICT
				responseJson.message = message(code: 'default.optimistic.locking.failure',
						args: [message(code: 'document.label', default: 'Document')],
						default: 'Another user has updated this Document while you were editing')
				cache false
				render responseJson as JSON
				return
            }
        }

        documentInstance.properties = request.JSON

        if (documentInstance.save(flush: true)) {
            response.status = SC_OK
            responseJson.id = documentInstance.id
            responseJson.message = message(code: 'default.updated.message', args: [message(code: 'document.label', default: 'Document'), documentInstance.id])
        } else {
            response.status = SC_UNPROCESSABLE_ENTITY
            responseJson.errors = documentInstance.errors.fieldErrors.collectEntries {
                [(it.field): message(error: it)]
            }
        }

        render responseJson as JSON
    }

    def delete() {
        def documentInstance = Document.get(params.id)
        if (!documentInstance) {
            notFound params.id
            return
        }

        def responseJson = [:]
        try {
            documentInstance.delete(flush: true)
            responseJson.message = message(code: 'default.deleted.message', args: [message(code: 'document.label', default: 'Document'), params.id])
        } catch (DataIntegrityViolationException e) {
            response.status = SC_CONFLICT
            responseJson.message = message(code: 'default.not.deleted.message', args: [message(code: 'document.label', default: 'Document'), params.id])
        }
        render responseJson as JSON
    }

    private void notFound(id) {
        response.status = SC_NOT_FOUND
        def responseJson = [message: message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), params.id])]
        render responseJson as JSON
    }
}
