

default: wannier

all: wannier

wannier: 
	(cd src ; make all)

debug: $(OBJS) 
	$(F90) wannier_prog.f90 $(LDOPTS) $(OBJS) $(LIBS) -o wannier90.x


clean:
	(cd src ; make clean)	

dist:
	@(tar cf - \
		./src/*.?90 \
		./src/Makefile \
		./tests/run_test.pl \
		./tests/test*/wannier.win \
		./tests/test*/des.dat \
		./tests/test*/wannier.eig \
		./tests/test*/wannier.*mn \
		./examples/*/wannier.eig \
		./tests/test*/stnd* \
		./examples/*/wannier.win \
		./examples/*/old* \
		./examples/*/new* \
                ./examples/*/*.*mn \
                ./examples/*/*.nnkp \
                ./examples/*/README \
		./config/* \
                ./spec/*.tex \
                ./spec/*.eps \
                ./spec/*.fig \
		./Makefile \
        | gzip -c > \
                ./wannier90.tar.gz)

test:   wannier
	@(cd ./tests ;\
		./run_test.pl)

dist-lite:
	@(tar cf - \
                ./src/?90 \
		./src/Makefile \
                ./Makefile \
        | gzip -c > \
                ./wannier90.tar.gz)


