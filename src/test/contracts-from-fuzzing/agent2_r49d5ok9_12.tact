contract TestDumpStack {
    // Test dumpStack() function to print the debug stack
    receive() {
        dumpStack();
    }
}
