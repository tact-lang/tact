// Test 8: Valid usage: Multiple wildcard parameters in a global function
fun sum(_: Int, _ : Int): Int {
    return 42;
}

contract Test {
    receive() {
        let r = sum(1, 2);
        dump(r);
    }
}
