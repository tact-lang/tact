fun testCatch() {
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
