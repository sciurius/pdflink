#! /bin/make -f

################ Pass-through ################

.PHONY : all
all :	Makefile cleanup
	mv Makefile.old Makefile
	$(MAKE) -f Makefile all

.PHONY : test
test : Makefile
	$(MAKE) -f Makefile test

.PHONY : clean
clean : cleanup
	rm -f *~

.PHONY : cleanup
cleanup : Makefile
	$(MAKE) -f Makefile clean

.PHONY : dist
dist : Makefile resources
	$(MAKE) -f Makefile dist

.PHONY : install
install : Makefile
	$(MAKE) -f Makefile install

Makefile : Makefile.PL
	perl Makefile.PL

################ Extensions ################

PERL := perl
PROJECT := PDFlink
TMP_DST := ${HOME}/tmp/${PROJECT}

to_tmp : resources
	rsync -avH --files-from=MANIFEST    ./ ${TMP_DST}/
	rsync -avH --files-from=MANIFEST.WX ./ ${TMP_DST}/

to_tmp_cpan :
	rsync -avH --files-from=MANIFEST.CPAN ./ ${TMP_DST}/

release :
	${MAKE} -C ../WxChordPro to_src
	${PERL} Makefile.PL
	${MAKE} -f Makefile all test dist

# Actualize resources.

LIB := lib/App/PDF/Link
RES := ${LIB}/res
PODSELECT := podselect

resources : ${RES}/pod/pdflink.pod

${RES}/pod/pdflink.pod : ${LIB}.pm
	${PODSELECT} $< > $@
