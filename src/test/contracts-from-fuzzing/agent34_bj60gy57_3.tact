contract Test {
    textCount: Int = 0;

    // Specific text comment receiver
    receive("hello") {
        self.textCount += 1;
    }
}
