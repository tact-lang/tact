// Scenario K: Using wildcard as the catch parameter in a try-catch block (discard error code)

fun testCatch() {
    try {
        throw(123);
    } catch (_) {
        dump(0); // Expect to dump 0 after catching error and discarding error code
    }
}

contract Test {
    receive() {
        testCatch();
    }
}
