// Test 2: Wildcard as a parameter in a non-receiver function
fun discard(_: Int): Int {
    return 0;
}

contract Test {
    receive() {
        let res: Int = discard(42);
    }
}
