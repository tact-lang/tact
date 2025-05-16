// Test 1: Wildcard in global function parameter (allowed use)
fun foo(_: Int): Int {
    return 123;
}

contract Test {
    receive() {
        let r = foo(456);
        dump(r);
    }
}
