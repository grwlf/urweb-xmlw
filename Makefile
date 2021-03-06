# This Makefile was generated by the Cake3
# https://github.com/grwlf/cake3

GUARD = .cake3/GUARD_$(1)_$(shell echo $($(1)) | md5sum | cut -d ' ' -f 1)

ifeq ($(MAIN),1)
unexport MAIN

# Main section

URVERSION = $(shell urweb -version)
.PHONY: ./all
./all: ./Makefile ./test/XMLW1.exe ./test/XMLW1.sql
./.cake3/tmp___test_XMLW1_in_2: ./Makefile ./lib.urp ./test/XMLW1.ur
	( \
	echo   ;\
	echo $$\/list  ;\
	echo $$\/char  ;\
	echo $$\/string  ;\
	echo \.\.\/test\/XMLW1  ;\
	) > ./.cake3/tmp___test_XMLW1_in_2
./.cake3/tmp___test_XMLW1_in_1: ./Makefile ./lib.urp ./test/XMLW1.ur
	( \
	echo database\ dbname\=XMLW1  ;\
	echo sql\ \.\.\/test\/XMLW1\.sql  ;\
	echo library\ \.\.\/  ;\
	) > ./.cake3/tmp___test_XMLW1_in_1
./.cake3/tmp___lib_in_2: ./Makefile ./XMLW.ur ./lib/urweb-monad-pack/lib.urp
	( \
	echo   ;\
	echo \.\/XMLW  ;\
	) > ./.cake3/tmp___lib_in_2
./.cake3/tmp___lib_in_1: ./Makefile ./XMLW.ur ./lib/urweb-monad-pack/lib.urp
	( \
	echo library\ \.\/lib\/urweb\-monad\-pack\/  ;\
	) > ./.cake3/tmp___lib_in_1
./.cake3/tmp___lib_urweb_monad_pack_lib_in_2: ./Makefile ./lib/urweb-monad-pack/error.ur ./lib/urweb-monad-pack/identity.ur ./lib/urweb-monad-pack/pure.ur ./lib/urweb-monad-pack/state.ur
	( \
	echo   ;\
	echo \.\/error  ;\
	echo \.\/state  ;\
	echo \.\/identity  ;\
	echo \.\/pure  ;\
	) > ./.cake3/tmp___lib_urweb_monad_pack_lib_in_2
./.cake3/tmp___lib_urweb_monad_pack_lib_in_1: ./Makefile ./lib/urweb-monad-pack/error.ur ./lib/urweb-monad-pack/identity.ur ./lib/urweb-monad-pack/pure.ur ./lib/urweb-monad-pack/state.ur
	echo -n > ./.cake3/tmp___lib_urweb_monad_pack_lib_in_1
.PHONY: ./lib
./lib: ./Makefile ./lib.urp
.INTERMEDIATE: ./.fix-multy1
./.fix-multy1: ./Makefile ./test/XMLW1.urp $(call GUARD,URVERSION)
	urweb -dbms sqlite ./test/XMLW1
./lib.urp: ./.cake3/tmp___lib_in_1 ./.cake3/tmp___lib_in_2 ./Makefile
	cat ./.cake3/tmp___lib_in_1 > ./lib.urp
	cat ./.cake3/tmp___lib_in_2 >> ./lib.urp
./test/XMLW1.exe: ./.fix-multy1
./test/XMLW1.sql: ./.fix-multy1
./test/XMLW1.urp: ./.cake3/tmp___test_XMLW1_in_1 ./.cake3/tmp___test_XMLW1_in_2 ./Makefile
	cat ./.cake3/tmp___test_XMLW1_in_1 > ./test/XMLW1.urp
	cat ./.cake3/tmp___test_XMLW1_in_2 >> ./test/XMLW1.urp
./lib/urweb-monad-pack/lib.urp: ./.cake3/tmp___lib_urweb_monad_pack_lib_in_1 ./.cake3/tmp___lib_urweb_monad_pack_lib_in_2 ./Makefile
	cat ./.cake3/tmp___lib_urweb_monad_pack_lib_in_1 > ./lib/urweb-monad-pack/lib.urp
	cat ./.cake3/tmp___lib_urweb_monad_pack_lib_in_2 >> ./lib/urweb-monad-pack/lib.urp
$(call GUARD,URVERSION):
	rm -f .cake3/GUARD_URVERSION_*
	touch $@

else

# Prebuild/postbuild section

ifneq ($(MAKECMDGOALS),clean)

.PHONY: ./all
./all: ./.fix-multy1
.PHONY: ./.cake3/tmp___test_XMLW1_in_2
./.cake3/tmp___test_XMLW1_in_2: ./.fix-multy1
.PHONY: ./.cake3/tmp___test_XMLW1_in_1
./.cake3/tmp___test_XMLW1_in_1: ./.fix-multy1
.PHONY: ./.cake3/tmp___lib_in_2
./.cake3/tmp___lib_in_2: ./.fix-multy1
.PHONY: ./.cake3/tmp___lib_in_1
./.cake3/tmp___lib_in_1: ./.fix-multy1
.PHONY: ./.cake3/tmp___lib_urweb_monad_pack_lib_in_2
./.cake3/tmp___lib_urweb_monad_pack_lib_in_2: ./.fix-multy1
.PHONY: ./.cake3/tmp___lib_urweb_monad_pack_lib_in_1
./.cake3/tmp___lib_urweb_monad_pack_lib_in_1: ./.fix-multy1
.PHONY: ./lib
./lib: ./.fix-multy1
.INTERMEDIATE: ./.fix-multy1
./.fix-multy1:
	-mkdir .cake3
	MAIN=1 $(MAKE) -f ./Makefile $(MAKECMDGOALS)
.PHONY: ./lib.urp
./lib.urp: ./.fix-multy1
.PHONY: ./test/XMLW1.exe
./test/XMLW1.exe: ./.fix-multy1
.PHONY: ./test/XMLW1.sql
./test/XMLW1.sql: ./.fix-multy1
.PHONY: ./test/XMLW1.urp
./test/XMLW1.urp: ./.fix-multy1
.PHONY: ./lib/urweb-monad-pack/lib.urp
./lib/urweb-monad-pack/lib.urp: ./.fix-multy1

endif
.PHONY: ./clean
./clean:
	-rm ./.cake3/tmp___lib_in_1 ./.cake3/tmp___lib_in_2 ./.cake3/tmp___lib_urweb_monad_pack_lib_in_1 ./.cake3/tmp___lib_urweb_monad_pack_lib_in_2 ./.cake3/tmp___test_XMLW1_in_1 ./.cake3/tmp___test_XMLW1_in_2 ./lib.urp ./test/XMLW1.exe ./test/XMLW1.sql ./test/XMLW1.urp ./lib/urweb-monad-pack/lib.urp
	-rm -rf .cake3

endif
