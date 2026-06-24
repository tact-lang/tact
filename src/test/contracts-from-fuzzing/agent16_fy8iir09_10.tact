fun testTryCatch() {
    try {
        throw(123);
    } catch (e) {
        dump(e);
    }
}

contract Test {
    receive() {
        testTryCatch();
    }
}
