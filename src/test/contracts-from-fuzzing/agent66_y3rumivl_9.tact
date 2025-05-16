fun testTryCatch() {
    try {
        throw(42);
    } catch (err) {
        dump(err);
    }
}

contract Test {
    receive() {
        testTryCatch();
    }
}
