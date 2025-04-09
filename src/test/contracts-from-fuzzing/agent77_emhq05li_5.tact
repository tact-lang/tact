// Test 4: Wildcard as function parameter (non-receiver)
fun helper(_: Int): Int {
    return 0;
}

contract Test {
    receive() {
        helper(1);
    }
}
