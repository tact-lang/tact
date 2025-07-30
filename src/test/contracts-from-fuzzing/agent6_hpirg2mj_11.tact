contract TestHexEscape {
    receive() {
        // Test string literal with hexadecimal escape sequence: \x41 should be 'A'
        let s: String = "Hex: \x41";
        let comment: Cell = s.asComment();
        return;
    }
}
