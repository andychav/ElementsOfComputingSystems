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
@24575
D=A
@screenEnd
M=D
(FOREVER)
    @KBD
    D=M //loads the value at keyboard
    @i
    M=0 
    @CLEAR
    D;JEQ
    @WRITE
    D;JNE

    //Write to screen
    (WRITE)
        @SCREEN
        D=A
        @i
        D=D+M //screen start + i
        M=M+1 //increment i
        A=D //gives A current word
        M=-1
        @screenEnd
        D=M-D
        @WRITE
        D;JNE
    @FOREVER
    0;JMP

    //CLEAR SCREEN
    (CLEAR)
        @SCREEN
        D=A
        @i
        D=D+M //screen start + i
        M=M+1 //increment i
        A=D //gives A current word
        M=0
        @screenEnd 
        D=M-D
        @CLEAR
        D;JNE
    @FOREVER
    0;JMP


