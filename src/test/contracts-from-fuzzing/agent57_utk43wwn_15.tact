contract Test {
    receive() {
        // Test I: Using a valid hex escape sequence \xNN
        // Expected: The hex escape sequence \x41 should produce 'A'
        let s: String = "Value: \x41";
        dump(s);
    }
}
