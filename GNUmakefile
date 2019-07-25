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
PROJECT := pdflink
TMP_DST := ${HOME}/tmp/${PROJECT}
RSYNC_ARGS := -rptgoDvHL

to_tmp : resources
	rsync ${RSYNC_ARGS} --files-from=MANIFEST    ./ ${TMP_DST}/

to_tmp_cpan :
	rsync ${RSYNC_ARGS} --files-from=MANIFEST.CPAN ./ ${TMP_DST}/

release : resources
	${PERL} Makefile.PL
	${MAKE} -f Makefile all test dist

# Actualize resources.

LIB := lib/App/PDF/Link
RES := res
PODSELECT := podselect

resources : ${RES}/pod/pdflink.pod

${RES}/pod/pdflink.pod : ${LIB}.pm
	${PODSELECT} $< > $@
