contract Test {
    // Empty receiver for empty messages
    receive() {
        // do nothing
    }

    // a dummy function call to force compilation
    get fun test(): Int {
        return 1;
    }
}