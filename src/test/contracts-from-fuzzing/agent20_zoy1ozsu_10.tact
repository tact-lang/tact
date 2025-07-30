contract Test {
    receive() {
        // Test string equality operator using "=="
        if ("Hello, Tact!" == "Hello, Tact!") {
            // equality holds
        } else {
            // unreachable
        }
    }
}
