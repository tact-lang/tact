contract TestDumpStack {
    // Test: dumpStack function to debug stack contents
    receive() {
        // Call dumpStack to check stack dump info
        dumpStack();
    }
}
