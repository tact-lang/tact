fun testCatch() {
    try {
        throw(123);
    } catch (_) {
        dump("caught");
    }
}

contract Test {
    receive() {
        testCatch();
    }
}
