// Test 6: Using wildcard as a parameter in a non-receiver function (valid discard usage)

fun f(_: Int): Int {
    // The wildcard parameter is discarded and cannot be accessed
    return 10;
}

contract Test {
    receive() {
        dump(f(7)); // Expect 10
    }
}
