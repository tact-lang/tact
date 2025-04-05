fun testTry(b: Bool): Int {
    try {
        if (b) { return 10; }
    } catch (e) {
        return e;
    }
    return 0;
}

contract Test {
    receive() {
        dump(testTry(true));  // Expecting 10
        dump(testTry(false)); // Expecting 0
    }
}
