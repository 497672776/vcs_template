vcs -full64 -notice -debug_all -j8 -timescale=1ns/1ps \
+plusarg_save +libext+.v+.V+.sv+.svh -sverilog +memcbk \
-P ${VERDI_HOME}/share/PLI/VCS/LINUX64/novas.tab \
${VERDI_HOME}/share/PLI/VCS/LINUX64/pli.a \
-cpp /usr/bin/g++ -cc /usr/bin/gcc \
-f file.list -f macro.list -top test \
-l compile.log
