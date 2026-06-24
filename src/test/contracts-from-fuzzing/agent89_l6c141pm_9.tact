contract Test {
    // Mixed receivers: literal vs generic text
    receive("hello") {
        // Matches exact message "hello"
    }
    receive(msg: String) {
        // Matches any text message not matched by literal receiver above
    }
}
