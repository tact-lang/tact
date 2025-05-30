contract TestHexEscape {
    receive() {
        // Test valid hex escape: \x21 should represent '!'
        let s: String = "Test: \x21";
    }
}
