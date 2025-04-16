contract TestExtensionCalls {
    receive() {
        // Testing extension function calls on literal expressions
        dump(42.toString());        // Expect string representation of 42
        dump("Hello, Tact!".asComment()); // Expect cell with comment "Hello, Tact!"
    }
}
