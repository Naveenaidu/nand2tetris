// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)

		
		@SCREEN 			 // addr = address of screen memory map
		D = A 				// Initializing the values for the screen monitor
		@ADDR
		M = D               // Store the address of screen to another variable addr
		

		@KBD
		D = M                 // Listening to the keyboard input


		@BLACK_SCREEN          // If D > 0  which implies that the key is pressed
		D;JGT				  // If the key is pressed blacken the screen

		@WHITE_SCREEN         // If D = 0  which implies no key is pressed
		D;JEQ                //  If no key is pressed then whiten the screen

		@LOOP
		0;JMP

(BLACK_SCREEN)
				
				

 				@KBD        //Keep filling the screen until the end of the screen address.
				D = A       //Since the memory map of keyboard comes below screen. Keep  
				@ADDR       // Filling the row until you reach keyboard address
				D = D - M       				                				                             
				@LOOP           
				D;JEQ           

				@ADDR    //Remmeber we saved the address of screen in a memory location named addr
				D = M    // D = RAM[addr] => 16,384(or something)	
				A = D    // A = D => A = 16,384. The address register now points to the address stored in addr register.
				M = -1   // Ram[A] = -1 => Ram[16,384] = -1

				@ADDR     //Incrementing the value of address stored in addr
				M = M + 1

				@BLACK_SCREEN //Jump back to the beginning to fill the other row.
				0;JMP

(WHITE_SCREEN)
				
				@KBD        
				D = A
				@ADDR
				D = D - M                			                             
				@LOOP           
				D;JEQ           

				@ADDR
				D = M         				  	
				A = D
				M = 0

				@ADDR
				M = M + 1

				@WHITE_SCREEN
				0;JMP				
