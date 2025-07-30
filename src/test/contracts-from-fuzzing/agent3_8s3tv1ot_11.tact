fun weirdEscape(): String {
    // Attempting a hex escape sequence that might not be supported.
    // We'll see how the compiler handles this.
    return "Hello\x41";
}

contract Test {
    receive() {
        let x = weirdEscape();
    }
}
