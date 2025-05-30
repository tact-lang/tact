contract TestReceiver {
    // A receiver function should not return any value.
    // Test using an explicit return without a value.
    receive() {
        return;
    }
}
