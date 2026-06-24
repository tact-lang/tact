contract EmptyReceiver {
    x: Int = 0;

    // This receiver function will be triggered for empty messages
    receive() {
        self.x = 42;
    }
}
