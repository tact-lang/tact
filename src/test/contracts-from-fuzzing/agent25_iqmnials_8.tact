// Test: Multiple wildcards in function parameter list - valid usage
fun multiDiscard(_: Int, _: Int, _: Int): Int {
    return 42;
}

contract TestMultiDiscard {
    receive() {
        dump(multiDiscard(1, 2, 3));
    }
}
