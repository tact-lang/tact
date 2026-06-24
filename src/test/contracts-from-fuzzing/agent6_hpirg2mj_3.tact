contract TestEscapeQuotes {
    receive() {
        // Test string literal with escaped double quotes
        let s: String = "He said \"Hello\"";
        let comment: Cell = s.asComment();
        return;
    }
}
