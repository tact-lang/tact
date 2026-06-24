contract UnusedGetter {
    // A getter that is declared but never used
    get fun unused(): Int {
        return 99;
    }

    receive() {}
}
