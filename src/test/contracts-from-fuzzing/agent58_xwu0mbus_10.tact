contract Test {
    // Test: using ascii compile-time function on a valid string up to 32 bytes
    a: Int = ascii("ABC");

    receive() {
        // Empty receive function
    }
}
