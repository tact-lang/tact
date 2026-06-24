contract Test {
    receive() {
        // Test valid two-digit hex escape sequence \x41 which should be 'A'
        let s: String = "Hex: \x41";
    }
}
