contract Test {
    // Test for empty message receiver: receive()
    receive() {
        // simple empty body
    }

    // The contract must be used so that the function is compiled
    // We add a dummy function call in the receiver (or simply include a getter)
    get fun dummy(): Int {
        return 1;
    }
}
