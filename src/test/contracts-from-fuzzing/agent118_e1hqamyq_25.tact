contract TestMultipleExternal {
    // Test: Valid contract with multiple external receivers with different literal texts
    external("hello") {
        // handle external message with literal "hello"
    }
    
    external("world") {
        // handle external message with literal "world"
    }

    // Also include a valid empty-messages receiver as fallback for internal messages
    receive() {
        // fallback for internal messages
    }
}
