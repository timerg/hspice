*FIlter Ideal
.protect
.lib 'rf018.l' TT
.unprotect
.option post acout=0 accurate dcon=1 CONVERGE=1 GMINDC= 1.0000E-12  unwrap = 1
+captab = 1 
***OP***

***netlist***

E1	o1	gnd	OPAMP	gnd	i1
E2	o2	gnd	OPAMP	gnd	i2
Ci	i1	o1 1p
Cc	o1	i2 10p
Cl	i2	o2 1p
Rl	i2	o2 1k
***output***



***param***
.param f = 320k


***source***
*Vs		vss	gnd dc = 0v
Iin	gnd i1 dc = 100n ac = 1 sin(20n 10n f 1ns)
Rin	i1	gnd 100k

***PoleZero testing***


***
.op
*.dc iin 1n	100n	0.1n
.ac dec 100 0.1	1000g
.probe ac vdb(o2) i(cc)
.pz v(o2) iin
*.tran 10ns 100u 
.end