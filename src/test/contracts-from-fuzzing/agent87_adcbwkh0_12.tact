contract Test {
    receive() {
        // Testing Unicode escapes: \uXXXX and \u{...}
        let s: String = "\u0041 and \u{1F602}"; // Expected to be "A and 😂"
        if (s == "A and 😂") {
            // Correct conversion
        } else {
            // Incorrect conversion
        }
    }
}
