// Test 9: Using '_' as a discard parameter in a non-trait regular function
fun testDiscard(_: Int): Int {
    // '_' parameter is discarded
    return 42;
}

contract Test {
    receive() {
         dump(testDiscard(100));
    }
}
