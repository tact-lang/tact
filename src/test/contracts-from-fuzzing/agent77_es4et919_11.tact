contract UnusedGetter {
    // This getter is declared but never called
    unused: Int = 42;

    receive() {}

    get fun getUnused(): Int {
        return self.unused;
    }
}
