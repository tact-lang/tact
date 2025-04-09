contract Test {
    receive() {
        // Testing multiple valid escape sequences in a string literal
        // Expected to compile successfully and treat escape sequences properly
        let s: String = "Line \n break, tab \t, backslash \\, quote \"text\"";
    }
}
