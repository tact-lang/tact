contract TestFallback {
    fallback_called: Int = 0;

    receive(msg: Slice) {
        self.fallback_called = 1;
    }

    // Dummy receive so contract is complete
    receive() {}
}
