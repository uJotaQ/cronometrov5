module duzen_min_set_reset(SET0, RST0, SET1, RST1, P, H, M, L, A, G);
	input P, H, M, L, A, G;
	output SET0, RST0, SET1, RST1;
	
	and(RST0, P);
	and(RST1, P);
	
	// SET FF1
	wire and1, and2, and3, and4, and5, adn6, and7;
	and(and1, !H, P, !M, !L);
	and(and2, P, !H, L, !A, !G);
	and(and3, P, !H, !M, !G);
	and(and4, P, !H, L, A, G);
	and(and5, P, !H, M, L, !A);
	and(and6, P, M, L, !A, !G);
	and(and7, P, M, L, A, G);
	or(SET0, and1, and2, and3, and4, and5, and6, and7);
	
	// SET FF2
	wire and11, and22, and33,and44, and55;
	and(and11, P, !H, !M);
	and(and22, P, !H, L, !G);
	and(and33, P, !H, L, A);
	and(and44, P, M, L, !G);
	and(and55, P, M, L, A);
	
endmodule
