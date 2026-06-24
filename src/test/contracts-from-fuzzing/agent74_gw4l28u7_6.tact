/* Test 5: Invalid usage - underscore as free function parameter */
fun test(_: Int): Int { return 1; }

contract Test {
    receive() { test(42); }
}
