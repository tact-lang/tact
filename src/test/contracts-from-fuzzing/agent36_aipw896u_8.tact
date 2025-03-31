contract ValidHexEscapeTest {
    receive() {
        // Use of a valid hexadecimal escape sequence: \x41 represents 'A'
        let s: String = "Letter: \x41";
        dump(s);
    }
}
