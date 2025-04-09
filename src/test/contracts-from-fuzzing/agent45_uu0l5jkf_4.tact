contract SpecificTextReceiver {
    x: Int = 0;

    // This receiver function will be triggered for text messages exactly matching "hello"
    receive("hello") {
        self.x = 100;
    }
}
