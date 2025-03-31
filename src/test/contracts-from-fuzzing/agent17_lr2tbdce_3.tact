contract TestTextReceiver {
    // Receiver for explicit text message "hello"
    receive("hello") {
        // matched text message
    }

    // Include a getter to ensure that the receiver is compiled
    get fun test(): Int {
        return 0;
    }
}
