contract Test {
    // Using underscore to discard the parameter in a text receiver
    receive(_ : String) {
        // intentionally ignoring the text content
    }
}
