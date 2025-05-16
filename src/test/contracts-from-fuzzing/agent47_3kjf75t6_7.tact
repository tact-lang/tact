// Test 1: Valid usage of wildcard in function parameter (discarding value)
fun f(_: Int): Int {
    return 42;
}

contract Test {
    receive() {
        f(12);
    }
}
