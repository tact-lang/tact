contract TestReceiverPriority {
    executed: Int = 0;

    // This receiver matches messages with the specific comment "test".
    receive("test") {
        self.executed = 1;
    }

    // This receiver matches arbitrary text messages that are not matched by a specific comment.
    receive(str: String) {
        self.executed = 2;
    }

    // This fallback receiver matches any binary message (Slice) that did not match previous receivers.
    receive(msg: Slice) {
        self.executed = 3;
    }

    // Dummy function to allow testing of receiver matching logic
    // In a real-world scenario, messages would be sent to this contract and the receiver functions would be executed accordingly.
    get fun getExecuted(): Int {
        return self.executed;
    }
}
