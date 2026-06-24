/* Test 2: Valid usage of multiple wildcards in function parameters */
fun add(_: Int, _: Int): Int {
    return 0;
}

contract Test {
    receive() {
        let res = add(1, 2);
    }
}
