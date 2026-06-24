fun testCatch() {
    // Valid usage: Using wildcard in catch pattern to discard exit code
    try {
        throw(42);
    } catch (_) {
        dump("caught");
    }
}

contract Test {
    receive() {
        testCatch();
    }
}
