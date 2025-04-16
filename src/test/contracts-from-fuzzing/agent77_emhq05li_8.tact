// Test 8: Wildcard as non-receiver function parameter (variant variant)
// Expected: Rejected because wildcards should only be allowed in receive parameters
fun add(_: Int, y: Int): Int {
    return y;
}

contract Test {
    receive() {
        add(10, 20);
    }
}
