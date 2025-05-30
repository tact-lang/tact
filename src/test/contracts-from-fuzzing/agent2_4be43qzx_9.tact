contract Test {
    fallbackCount: Int = 0;

    // Fallback receiver for binary messages not matching any other receiver
    receive(msg: Slice) {
        self.fallbackCount = self.fallbackCount + 1;
    }
}
