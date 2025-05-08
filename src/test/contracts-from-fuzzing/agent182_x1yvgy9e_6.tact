contract Test {
    // Test fallback receiver with underscore parameter discard
    receive(_ : Slice) { 
        // Fallback handler using underscore to discard the argument
    }
}
