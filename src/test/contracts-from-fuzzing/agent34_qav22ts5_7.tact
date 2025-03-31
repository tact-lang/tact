// Test: Using _ in try-catch to discard exit code
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
