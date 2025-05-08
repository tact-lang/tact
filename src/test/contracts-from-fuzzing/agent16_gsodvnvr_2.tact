contract DebugDemo {
    // Correct usage of dump, as documented, expecting one argument
    receive() {
        dump(42);
        cashback(sender());
    }
}
