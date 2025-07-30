/* Snippet 7: Valid usage of _ as function parameter discard in a global function */
fun testDiscard(_: Int): Int {
    // _ parameter is intentionally discarded
    return 1;
}

contract Test {
    receive() {
        // Call the function with underscore parameter
        let res = testDiscard(42);
        dump(res);
    }
}
