contract TestStringQuotes {
    receive() {
        // Test escaping double quotes inside string literal
        let s: String = "He said \"Hello\" to the world!";
    }
}
