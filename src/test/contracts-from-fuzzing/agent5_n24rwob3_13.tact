fun testCatchDiscard() {
    try {
        throw(100);
    } catch (_) {
        dump("Caught error with discard");
    }
}

contract Test {
    receive() {
        testCatchDiscard();
    }
}
