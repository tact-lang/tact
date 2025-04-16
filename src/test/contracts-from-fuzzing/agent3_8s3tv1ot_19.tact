fun malformedEscape(): String {
    // Attempting an unsupported partial escape sequence.
    return "Hello\\0"; // We'll see how the compiler treats this
}

contract Test {
    receive() {
        let x = malformedEscape();
    }
}
