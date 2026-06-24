contract Test {
    state: Int = 0;
    
    // Receiver for all binary messages using underscore to discard parameter
    receive(_: Slice) {
        self.state += 5;
    }

    // Dummy receiver for empty messages to have complete contract
    receive() {}
}
