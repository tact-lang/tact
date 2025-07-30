contract Test {
    fallbackCalled: Int = 0;

    // Fallback binary receiver (Slice)
    receive(msg: Slice) {
        self.fallbackCalled = 1;
    }
}
