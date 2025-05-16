contract TestSpecificReceiver {
    executed: Int = 0;

    // Specific text receiver
    receive("hello") {
        self.executed = 1;
    }
}
