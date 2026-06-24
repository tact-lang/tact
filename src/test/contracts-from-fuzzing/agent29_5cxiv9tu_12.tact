contract Test {
    x: Int = 42;

    // Getter declared but never used
    get fun unusedGetter(): Int {
        return self.x;
    }

    // Only receiver that does nothing
    receive() {}
}
