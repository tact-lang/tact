contract TestStringLiterals {
    receive() {
        // Test simple string literal without escapes
        let a: String = "Hello, World!";
        let comment1: Cell = a.asComment();

        // Test string literal with newline escape sequence
        let b: String = "Line1\nLine2";
        let comment2: Cell = b.asComment();

        // Test string literal with tab escape sequence
        let c: String = "Column1\tColumn2";
        let comment3: Cell = c.asComment();

        // Test using StringBuilder for concatenation
        let sb: StringBuilder = beginComment();
        sb.append(a);
        sb.append(" - ");
        sb.append(b);
        let comment4: Cell = sb.toCell();
        return;
    }
}
