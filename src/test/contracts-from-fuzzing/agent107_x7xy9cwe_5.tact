contract TestReturnsReceiver {
    // Receiver with a return statement
    receive(msg: String) {
        return; // attempt to use return in receiver
    }

    // Valid receiver with no return statement
    receive() {}
}
