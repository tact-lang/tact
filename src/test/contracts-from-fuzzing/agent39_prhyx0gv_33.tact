contract Test {
    // Test: Specific text receiver with a comment exactly 123 bytes long
    // The following literal is exactly 123 characters long (123 'a's):
    // 12 groups of 10 'a's = 120, plus 3 'a's = 123
    receive("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") {
        // No operation
    }

    // Fallback receiver to catch other messages
    receive(msg: Slice) {
        // Fallback: do nothing
    }
}
