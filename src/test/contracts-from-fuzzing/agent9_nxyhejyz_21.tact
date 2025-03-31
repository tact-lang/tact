contract TestStrings {
    receive() {
        // Testing Unicode escape with brace syntax
        let s = "\u{2603}"; // supposed to represent '☃'
    }
}