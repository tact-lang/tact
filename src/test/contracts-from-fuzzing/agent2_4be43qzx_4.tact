contract Test {
    textCount: Int = 0;

    // Receiver for messages containing exactly "hello"
    receive("hello") {
        self.textCount = self.textCount + 1;
    }
}
