contract TestEmptyReceiver {
    executed: Int = 0;

    // Empty message receiver
    receive() {
        self.executed = 1;
    }
}
