import com.qualcomm.it.docviewer.Document

class BootStrap {

    def init = { servletContext ->
		new Document(author:"Lisa Lang", docDescription:"Guide to Grails", pubDate:new Date().parse("dd/MMM/yyyy", "05/Mar/2015")).save(failOnError:true)
		new Document(author:"Sheryl Sandberg", docDescription:"Lean In").save(failOnError:true)
		new Document(author:"Richard O'Connor", docDescription:"Rewire Your Brain", pubDate:new Date().parse("dd/MMM/yyyy", "21/Mar/2014")).save(failOnError:true)
    }
    def destroy = {
    }
}
