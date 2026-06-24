contract TestEmptyString {
    receive() {
        // Test empty string literal
        let s: String = "";
        let comment: Cell = s.asComment();
        return;
    }
}
