contract TestUnused {
    receive() {}

    // Getter declared but never referenced in the code
    get fun unusedGetter(): Int {
        return 42;
    }
}
