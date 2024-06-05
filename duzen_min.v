module duzen_min(CLK, P, H, M, L, G, A, adm, bdm, cdm, ddm, edm, fdm, gdm);
	
	input CLK, P, H, M, L, G, A;
	output adm, bdm, cdm, ddm, edm, fdm, gdm;
	
	wire Q1, Q1_, Q2, Q2_, RST, RST0, RST1, SET0, SET1;
	wire R0, R1, w1;
	
	duzen_min_set_reset dmsr(SET0, RST0, SET1, RST1, P, H, M, L, A, G);
		
	dFlipFlop(Q1_,RST0, CLK, SET0, Q1, Q1_);
	dFlipFlop(Q2_,RST1, Q1_, SET1, Q2, Q2_);
	
	//LED A
	and(adm, Q2, Q1_);
	
	//LED B
	and(bdm, 1'b0);
	
	//LED C
	and(cdm, Q2_, Q1);
	
	//LED D
	and(ddm, Q2, Q1_);
	
	//LED E
	and(edm, Q1_);
	
	//LED F
	or(fdm, Q2_, Q1_);
	
	//LED G
	and(gdm, Q2);
	
endmodule
