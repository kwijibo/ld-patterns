STYLESHEETS_DIR = /usr/share/xml/docbook/stylesheet/docbook-xsl

all: html pdf chunk epub

chunk:
	xsltproc --stringparam base.dir "book/" \
		--stringparam chunk.first.sections "1" \
		--stringparam use.id.as.filename "1" \
		--stringparam toc.section.depth "1" \
        	-o index.html $(STYLESHEETS_DIR)/xhtml/chunk.xsl src/linked-data-patterns.xml

html:
	xsltproc --stringparam base.dir "book/" \
		--stringparam toc.section.depth "1" \
		-o book/index-full.html $(STYLESHEETS_DIR)/xhtml/docbook.xsl src/linked-data-patterns.xml

fo:
	xsltproc --stringparam base.dir "book/" \
		--stringparam toc.section.depth "1" \
		-o book/linked-data-patterns.fo $(STYLESHEETS_DIR)/fo/docbook.xsl src/linked-data-patterns.xml

pdf: fo
	fop -pdf book/linked-data-patterns.pdf -fo book/linked-data-patterns.fo

epub:
	dbtoepub -o book/linked-data-patterns.epub src/linked-data-patterns.xml

clean:
	rm -rf book
