contract Test {
    receive() {
        // Testing a string literal containing a null byte via hex escape \x00
        let s: String = "Hello\x00World";
        dump(s);
    }
}
