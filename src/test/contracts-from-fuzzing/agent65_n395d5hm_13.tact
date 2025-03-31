contract UnusedGetter {
    receive() {}

    // Getter declared but never used
    get fun unusedGetter(): Int {
        return 123;
    }
}
