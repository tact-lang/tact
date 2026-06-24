contract TestReceiverValid {
    // Test 6: Valid receiver function. Its parameter is allowed to be a message in the form of String.
    receive(msg: String) {
        // Receiver functions are void so only an empty return is allowed.
        return;
    }
}
