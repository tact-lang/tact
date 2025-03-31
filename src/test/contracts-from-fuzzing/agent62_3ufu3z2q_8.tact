contract Test {
    receive() {
        // Test: valid hex escape sequence using \x escape
        let s: String = "Line1\x0ALine2";
        if (s != "Line1\nLine2") {
            throw(1);
        }
    }
}
