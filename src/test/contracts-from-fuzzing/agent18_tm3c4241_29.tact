contract ReceiverReturn {
    // Testing a receiver that attempts an explicit 'return;' statement
    // Receiver functions have no return type, so an explicit 'return;' should be allowed as a statement
    receive() {
        return;  // Early exit; no value needed
    }
}
