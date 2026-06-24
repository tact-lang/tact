/* Test 8: Valid usage - wildcard in try-catch catch clause to discard error code */
fun test() {
    try {
        throw(42);
    } catch (_) {
        // Discard caught error code
    }
}

contract Test {
    receive() { test(); }
}
