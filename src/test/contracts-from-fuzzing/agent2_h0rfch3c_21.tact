///////////////////////////////
// Test 23: Using wildcard as catch parameter in try...catch block

fun testCatch() {
    try {
        throw(42);
    } catch (_) {
        // Error discarded; simply dump 100
        dump(100);
    }
}

contract Test {
    receive() {
         testCatch();
    }
}
