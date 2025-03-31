contract Test {
    receive() {
        let s: String = "\x41\x42\x43"; // Should be "ABC"
    }
}
