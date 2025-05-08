// Snippet 6: Using multiple wildcards in a function parameter list (valid usage)

fun testDual(_: Int, _: Int): Int {
    return 0;
}

contract MultiWildcards {
    receive() {
        // Call the function with two wildcard parameters
        testDual(10, 20);
    }
}
