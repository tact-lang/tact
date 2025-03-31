contract Test {
    // Arbitrary text message receiver declared first
    receive(str: String) {
        // This should catch any text message not matched by a literal receiver
        return;
    }

    // Specific text literal receiver declared after the generic one
    receive("hello") {
        // According to documentation, literal match should have priority over generic string
        return;
    }
}
