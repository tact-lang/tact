fun testCatch() {
    try {
        throw(42);
    } catch (_) {
        dump("Caught error with wildcard");
    }
}

contract Test {
    receive() {
        testCatch();
    }
}
