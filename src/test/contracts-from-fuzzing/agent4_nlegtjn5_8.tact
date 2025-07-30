// Test A: Valid usage - Multiple wildcards in a function parameter list
fun sum(_: Int, _: Int): Int {
    return 100;
}

contract Test {
    receive() {
        dump(sum(10, 20));
    }
}
