contract Test {
    receive() {
        // Test hex escape sequence: \x41 should be parsed as 'A' (0x41)
        let s: String = "Start:\x41 End";
    }
}
