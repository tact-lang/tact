contract Test {
    // Specific text message receiver triggers only for message "hi"
    receive("hi") {
        // Handling for input "hi"
    }

    // Fallback text message receiver using underscore to discard parameter
    receive(_ : String) {
        // Handling for arbitrary text messages
    }
}
