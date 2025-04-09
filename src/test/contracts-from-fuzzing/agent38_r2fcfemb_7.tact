contract Test {
    receive() {
        // Testing valid \x escape sequence: \x22 represents a double quote
        let s: String = "Quote: \x22";
    }
}
