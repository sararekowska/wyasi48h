scf4: exe
	alacritty --hold --command ./exe

scf5: exe
	echo "exe compiled"

scf6:
	alacritty --hold --command ghci main.hs

exe: main.hs
	ghc -o exe main.hs

clean:
	rm *.o exe main *.hi
