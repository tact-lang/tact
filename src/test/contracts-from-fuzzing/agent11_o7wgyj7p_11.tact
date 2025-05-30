contract TestDumpStack {
    receive() {
        // Testing dumpStack() which should print the stack content in debug mode
        dumpStack();
    }
}
