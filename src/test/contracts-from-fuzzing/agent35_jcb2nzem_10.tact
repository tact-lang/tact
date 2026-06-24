contract TestReceiver {
    // Receive functions have no return type and are intended to handle messages
    // Here we test using a plain return statement inside a receiver
    receive() {
        return;
    }
}
