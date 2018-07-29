// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

//Load the values of R0 and R1

//R2 holds the value of sum
@R2
M = 0

@R0
D = M 

@R1
D = D - M

@R0_GRT
D;JGT                  // If R0 > 0 (implies R0>R1), then jump to R0_GRT

@R1_GRT
D;JLT                  // If R0 < 0 (implies R1>R0), then jump to R1_GRT


(R0_GRT)
    
	    @R1 		 // num = [R1] 
	    D = M
	    @NUM
	    M = D

	    @R0  	     // count = [R0]
	    D = M    
	    @COUNT 
	    M = D

	    @LOOP		 // unconditional jump to loop
	    0;JMP

(R1_GRT)

		@R0 	     // num = [R0] 
	    D = M
	    @NUM
	    M = D

	    @R1  	     // count = [R1]
	    D = M    
	    @COUNT 
	    M = D

	    @LOOP		 // unconditional jump to loop
	    0;JMP

(LOOP)
		
		@COUNT      // If count = 0, then jump to END
		D = M		
		@END
		D;JEQ

		@NUM        // sum = sum + num
		D = M
		@R2
		M = M + D

		@COUNT      // count = coutn - 1
		M = M - 1
		
		@LOOP       // Loop back and repeat the process
		0;JMP      

(END)
	   
	   @END         //Infinte Loop
	   0;JMP


