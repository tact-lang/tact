contract Test {
    receive() {
        dumpStack(); // Expect dumpStack to print the current stack state
    }
}
