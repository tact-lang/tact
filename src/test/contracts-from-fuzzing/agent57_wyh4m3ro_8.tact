contract TestReceiverReturn {
    // Attempt to use return statement in receive function
    // In Tact, receive functions do not have a declared return type
    // and typically should not use a return value. We'll test behavior of an empty return.
    receive() {
        return; // empty return
    }
}
