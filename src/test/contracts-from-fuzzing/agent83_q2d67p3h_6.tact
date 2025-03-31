// Test 2: Valid usage - using wildcard as a parameter in a global function
fun foo(_: Int): Int {
    return 42;
}

contract Test {
    receive() {
        let x = foo(10);
    }
}
