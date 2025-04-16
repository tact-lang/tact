/// Fuzz-Test Suite: Test 13: Emit function usage

contract TestEmit {
    receive() {
        // Convert string to cell using asComment()
        // This should queue a log message for off-chain analysis
        emit("Hello, world".asComment());
    }
}
