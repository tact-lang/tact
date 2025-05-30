contract TestAsciiMax {
    // Exactly 32 bytes string (10+10+10+2 = 32 bytes)
    a: Int = ascii("0123456789abcdefghijABCDEFGHIJXY");
    
    receive () {}
}
