contract DebugTestDumpStack {
    // Test dumpStack() which prints the current call stack (if debug mode is enabled)
    receive() {
        dumpStack();
    }
}
