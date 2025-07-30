contract TestUnderscore {
    // Fallback receiver with ignored parameter using underscore
    receive(_: Slice) {
        // handling binary messages
    }

    // Getter to ensure receiver is compiled
    get fun test(): Int {
        return 0;
    }
}
