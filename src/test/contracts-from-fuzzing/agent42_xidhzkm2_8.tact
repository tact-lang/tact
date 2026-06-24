fun testTryCatchValid() {
    try {
        throw(42);
    } catch (e) {
        dump(e); // should dump 42
    }
}

contract Test {
    receive() {
        testTryCatchValid();
    }
}
