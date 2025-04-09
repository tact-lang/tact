contract TestEscapeSeq {
    receive() {
        // Testing various valid escape sequences in a string literal:
        // \n for newline, \t for tab, \\ for literal backslash, \" for double quote, \x41 for 'A'
        let s: String = "Line1\nLine2\tTabbed\\Backslash and a quote: \" and a hex: \x41";
    }
}